class Clan < ApplicationRecord
  has_many :members
  has_many :former_members, class_name: 'Member', foreign_key: 'previous_clan_id'

  TOP_CLAN_BASE_URL = "https://api.worldoftanks.com/wot/clanratings/top/"

  def total_members
    members.count
  end

  def total_former_members
    former_members.count
  end

  def self.fetch_top_clans
    rank_field = 'efficiency'

    (1..10).each do |page_no|
      url = "#{TOP_CLAN_BASE_URL}?application_id=#{ENV['wot_api_key']}&rank_field=#{rank_field}&page_no=#{page_no}"
      data = DataFetcherService.fetch_data(url)

      # Check if data was returned before proceeding
      if data && data['data']
        data['data'].each do |clan_data|
          clan = Clan.find_or_initialize_by(clan_id: clan_data['clan_id'])
          clan.name = clan_data['clan_tag']
          clan.rank = clan_data['efficiency']['rank']
          clan.save
        end
      else
        puts "No data received for page #{page_no}"
      end
    end
  end
end
