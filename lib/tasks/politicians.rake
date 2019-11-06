namespace :politicians do
  task :fetch => :environment do
    response = RestClient::Request.execute(
      method: :get,
      url: "https://www.nosdeputes.fr/deputes/json",
    )

    JSON.parse(response)["deputes"].each do |deputies|
      deputy = deputies["depute"]

      politician = Politician.create!(
        id_an: deputy["id_an"],
        first_name: deputy["prenom"],
        last_name: deputy["nom_de_famille"],
        name: deputy["nom"],
        gender: deputy["sexe"],
        dob: deputy["date_naissance"],
        pob: deputy["lieu_naissance"],
        department: deputy["num_deptmt"],
        circonscription: deputy["nom_circo"],
        circonscription_number: deputy["num_circo"],
        mandat_start: DateTime.parse(deputy["mandat_debut"]),
        group_sigle: deputy["groupe_sigle"],
        party_name: deputy["parti_ratt_financier"],
        email: deputy["emails"][0]["email"],
        collaborators: deputy["collaborateurs"].map { |e| e["collaborateur"] },
        profession: deputy["profession"],
        hemicycle_place: deputy["place_en_hemicycle"],
        slug: deputy["slug"],
        url_an: deputy["url_an"],
        mandat_number: deputy["nb_mandats"],
        twitter: deputy["twitter"],
        party: Party.find_by(acronym: deputy["groupe_sigle"]),
      )

      Activity.create!(
        politician: politician,
        global: true,
        amendements_adopted: 0,
        amendements_proposed: 0,
        amendements_signed: 0,
        commission_interventions: 0,
        commission_presences: 0,
        hemicycle_interventions: 0,
        hemicycle_short_interventions: 0,
        written_proposals: 0,
        signed_proposals: 0,
        oral_questions: 0,
        written_questions: 0,
        reports: 0,
        presence: 0,
      )
    end
  end
end
