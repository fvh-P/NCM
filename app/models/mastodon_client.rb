# == Schema Information
#
# Table name: mastodon_clients
#
#  id            :bigint           not null, primary key
#  domain        :string
#  client_id     :string
#  client_secret :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MastodonClient < ApplicationRecord
end
