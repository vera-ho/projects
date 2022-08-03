class ShortenedUrl < ApplicationRecord

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    def self.random_code
        exists = true
        while exists
            code = SecureRandom.urlsafe_base64
            exists = ShortenedUrl.exists?(:short_url => code)
        end
        code
    end

    # input user object, long_url string
    def self.shorten_url(user, long_url)
        short_url = ShortenedUrl.new({long_url: long_url, 
            short_url: ShortenedUrl.random_code, user_id: user.id })
        short_url.save!
    end
end
