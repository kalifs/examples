require_relative 'roles/model'
require_relative 'roles/account'
require_relative 'roles/sanitized_attributes'
require_relative 'context/create_project_context'
require_relative 'context/sign_up_context'
require_relative 'context/deposit_money_context'
require_relative 'context/finance_project_context'
require_relative 'models/project'
require_relative 'models/user'

require 'sequel'

DB = Sequel.sqlite

module MyApp
  def self.migrate
    DB.create_table :projects do
      primary_key :id
      String :name
      Time :end_date
      Integer :owner_id
      Integer :funds
    end

    DB.create_table :users do
      primary_key :id
      String :name
      Integer :funds
    end
  end
end

MyApp.migrate
