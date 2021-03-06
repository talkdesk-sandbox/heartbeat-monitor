# frozen_string_literal: true

require 'sequel'
require 'logger'

class Calls
  STARTED = 'started'
  FINISHED = 'finished'

  attr_reader :db

  # @TODO: Sequel recomends one instance per application,
  # I need to sort out how to manage that in Ruby (pass it to the initializer?)
  # Left as TODO since at the moment it's the only instance, but that will change.
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

  def insert_or_update(interaction_id, twilio_id, state)
    table = @db[:calls]
    if table.where(interaction_id: interaction_id).count.zero?
      insert_with_transaction(table, interaction_id, twilio_id, state)
    else
      update_with_transaction(table, interaction_id, twilio_id, state)
    end
  end

  def insert_with_transaction(table, interaction_id, twilio_id, state)
    @db.transaction do
      table.insert(
        interaction_id: interaction_id,
        twilio_id: twilio_id,
        state: state,
      )
    end
  end

  def update_with_transaction(table, interaction_id, twilio_id, state)
    @db.transaction do
      table.where(interaction_id: interaction_id).update(
        twilio_id: twilio_id,
        state: state,
      )
    end
  end

  def delete_old_calls(days:)
    @db.transaction do
      @db[:calls].where { created_at < DateTime.now - days }.delete
    end
  end
end
