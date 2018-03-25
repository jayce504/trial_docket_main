class AddRestOfClientInformation < ActiveRecord::Migration
  def change
    add_column :clients, :hearing_dates, :date
    add_column :clients, :beginning_date, :date
    add_column :clients, :disposition_date, :date
    add_column :clients, :time_outside_of_court, :float
    add_column :clients, :time_in_court, :float
    add_column :clients, :time_waiting_in_court, :float
    add_column :clients, :date_of_first_client_interaction, :date
    add_column :clients, :sentencing_judge, :string
    add_column :clients, :disposition, :string
    add_column :clients, :case_outcome, :string
  end
end
