require 'rails_helper'
require 'rake'

describe 'products:csv_sync' do
  before :all do
    Rake.application.rake_require 'tasks/csv_sync'
    Rake::Task.define_task(:environment)
  end
  describe 'test rake task' do
    let! :run_rake_task do
      Rake::Task['products:csv_sync'].reenable
      Rake.application.invoke_task 'products:csv_sync'
    end

    it 'should send all the contracts' do
      run_rake_task
      expect(CSV.read('data/MOCK_DATA.csv').size - 1).to eq(Product.count)
    end
  end
end
