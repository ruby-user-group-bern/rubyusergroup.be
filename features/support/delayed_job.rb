def work_off_delayed_jobs
  Delayed::Worker.new.work_off unless Delayed::Job.all.empty?
end
