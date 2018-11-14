# frozen_string_literal: true

# Deprecated in favor of using sequel

require 'pg'

class Postgres

  attr_reader :connection

  def initialize
    @connection = PG.connect(ENV['POSTGRES_URL'])
  end

  def test_db_connection(value)
    id = Time.now.getutc.to_i
    result = @connection.exec("INSERT INTO test (id, value) VALUES (#{id}, '#{value}');")

    result
  end
end
