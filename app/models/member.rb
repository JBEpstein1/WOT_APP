class Member < ApplicationRecord
  belongs_to :clan
  belongs_to :previous_clan, class_name: 'Clan', optional: true

  CLAN_MEMBER_BASE_URL =

  def left_clan?
    !!previous_clan_id
  end

  def get_clan_members(clan_id)
    DataFetcherService.fetch_data()
    response = HTTParty.get("https://api.worldoftanks.com/wot/clans/info?application_id=YOUR_APP_ID&clan_id=#{clan_id}")
    JSON.parse(response.body)['data'][clan_id]['members']
  end
end
