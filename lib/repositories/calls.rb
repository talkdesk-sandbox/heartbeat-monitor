# frozen_string_literal: true

require 'sequel'
require 'logger'

class Calls
  attr_reader :db

  def initialize
    @db = Sequel.connect(ENV['POSTGRES_URL'])
    @db.loggers << Logger.new($stdout)
  end

  def create_schema
    @db.create_table :calls do
      primary_key :id, index: true
      String :interaction_id, unique: true, null: false
      String :twilio_id
      String :state
      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  def drop_table
    @db.drop_table :calls
  end

  def insert_with_transaction(interaction_id, twilio_id, state)
    table = @db[:calls]
    @db.transaction do
      table.insert(
        interaction_id: interaction_id,
        twilio_id: twilio_id,
        state: state,
      )
    end
    # Committed.
  end
end
