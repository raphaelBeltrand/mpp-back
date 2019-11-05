namespace :parties do
  task :fetch => :environment do
    response = RestClient::Request.execute(
      method: :get,
      url: "https://www.nosdeputes.fr/organismes/groupe/json",
    )

    JSON.parse(response)["organismes"].each do |organisme|
      orga = organisme["organisme"]
      Party.create!(
        slug: orga["slug"],
        acronym: orga["acronyme"],
        name: orga["nom"],
        color: orga["couleur"],
      )
    end
  end
end
