# RSpec.describe ApplicationJob, type: :job do

#     describe "#perform" do
#     it "retries the job by enqueuing again on deadlock error" do
#       # Stubbing the perform method of ApplicationJob
#       allow_any_instance_of(ApplicationJob).to receive(:perform).and_wrap_original do |original_method, *args|
#         begin
#           original_method.call(*args)
#         rescue DeadlockError
#           # Retry logic here
#           # For example, enqueue the job again
#           described_class.perform_later(*args)
#         end
#       end
#       end
  
#       context "with deserialization error" do
#         it "discards the job" do
#           # Stub discard method on ActiveJob::Base
#           allow(ActiveJob::Base).to receive(:discard)
      
#           # Raise a generic error mimicking an enqueued job
#           expect { raise ActiveJob::DeserializationError }.to raise_error(ActiveJob::DeserializationError)
#         end
#       end
           
# end
# end
