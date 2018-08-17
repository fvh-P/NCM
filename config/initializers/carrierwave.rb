def use_s3?
  ENV['S3_ACCESS_KEY'] && ENV['S3_SECRET_KEY'] && ENV['S3_REGION'] && ENV['S3_BUCKET']
end

## CarrierWaveの設定
CarrierWave.configure do |config|
  # S3の設定
  if use_s3?
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key  => ENV['S3_SECRET_KEY'],
        :region                 => ENV['S3_REGION'],
    }

    # S3のバケットを指定。
    config.fog_directory     = ENV['S3_BUCKET']
    # 一般公開させて無いS3の場合は以下の設定を行う。
    config.fog_public     = true
    CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  end

  config.cache_storage = :fog #キャッシュの場所をS3に変更
  config.cache_dir = "#{Rails.root}/tmp/uploads" #for Heroku
end
