FactoryBot.define do
    factory :fashion do
        title {'TEST'}
        body {'TEST'}
        shop {'TEST'}
        pic { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png"), 'image/png') }
        association :user
    end
end