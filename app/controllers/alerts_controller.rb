class AlertsController < ApplicationController
	before_filter :authenticate_admin
  def index
  	@alerts = Alert.all
  end

  def new
  	@record_id = params['record_id']
  end

  def add_alert
  	alert = Alert.new()
  	alert.record_id = params["record_id"]
  	alert.user_id = params["user_id"]
  	alert.text = params["message"]
  	alert.save
  	redirect_to root_path
  end

  def approve
  	alert_id = params["id"]
  	alert = Alert.find(alert_id)
  	alerting_user = User.find(alert.user_id)
  	record = DatasetRecord.find(alert.record_id)
  	dataset = Dataset.find(record.dataset_id)
  	record_user = User.find(dataset.user_id)
  	alert.destroy
  	record.destroy
  	if alerting_user.reliability.nil?
  		alerting_user.reliability = 1
  	else
  		alerting_user.reliability = alerting_user.reliability + 1
  	end
  	alerting_user.save

  	if record_user.reliability.nil?
  		record_user.reliability = -2
  	else
  		record_user.reliability = record_user.reliability - 2
  	end
  	record_user.save

  	redirect_to :index_alert
  end

  def decline
  	alert_id = params["id"]
  	alert = Alert.find(alert_id)
  	alerting_user = User.find(alert.user_id)
  	alert.destroy
  	if alerting_user.reliability.nil?
  		alerting_user.reliability = -1
  	else
  		alerting_user.reliability = alerting_user.reliability - 1
  	end
  	alerting_user.save
  	redirect_to :index_alert
  end

  def show
	@alert = Alert.find(params["id"])	
	@alerting_user = User.find(@alert.user_id)
	record = DatasetRecord.find(@alert.record_id)
	@dataset = Dataset.find(record.dataset_id)
  end
end
