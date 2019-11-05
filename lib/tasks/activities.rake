namespace :activities do
  task :fetch_old_data => :environment do
    date = ["201706", "201707", "201708", "201709", "201710", "201711", "201712", "201801", "201802", "201803", "201804", "201805", "201806", "201807", "201808", "201809", "201810", "201811", "201812", "201901", "201902", "201903", "201904", "201905", "201906", "201907", "201908", "201909", "201910"]

    date.each do |d|
      response = RestClient::Request.execute(
        method: :get,
        url: "https://www.nosdeputes.fr/synthese/#{d}/json",
      )

      JSON.parse(response)["deputes"].each do |politician|
        deputy = politician["depute"]
        month_start = DateTime.parse(d + "01")

        Activity.create!(
          politician: Politician.find_by(name: deputy["nom"]),
          start_date: month_start,
          end_date: month_start.end_of_month > Time.now ? Time.now : month_start.end_of_month,
          amendements_adopted: deputy["amendements_adoptes"],
          amendements_proposed: deputy["amendements_proposes"],
          amendements_signed: deputy["amendements_signes"],
          commission_interventions: deputy["commission_interventions"],
          commission_presences: deputy["commission_presences"],
          hemicycle_interventions: deputy["hemicycle_interventions"],
          hemicycle_short_interventions: deputy["hemicycle_interventions_courtes"],
          written_proposals: deputy["propositions_ecrites"],
          signed_proposals: deputy["propositions_signees"],
          oral_questions: deputy["questions_ecrites"],
          written_questions: deputy["questions_orales"],
          reports: deputy["rapports"],
          presence: deputy["semaines_presence"],
        )
      end
    end
  end

  task :fetch_daily_data => :environment do
    response = RestClient::Request.execute(
      method: :get,
      url: "https://www.nosdeputes.fr/synthese/data/json",
    )

    JSON.parse(response)["deputes"].each do |deputies|
      deputy = deputies["depute"]

      politician = Politician.find_by(name: deputy["nom"])
      global_activity = Activity.find_by(global: true, politician: politician)

      Activity.create!(
        politician: politician,
        start_date: Time.now,
        end_date: Time.now,
        amendements_adopted: deputy["amendements_adoptes"] - global_activity.amendements_adopted,
        amendements_proposed: deputy["amendements_proposes"] - global_activity.amendements_proposed,
        amendements_signed: deputy["amendements_signes"] - global_activity.amendements_signed,
        commission_interventions: deputy["commission_interventions"] - global_activity.commission_interventions,
        commission_presences: deputy["commission_presences"] - global_activity.commission_presences,
        hemicycle_interventions: deputy["hemicycle_interventions"] - global_activity.hemicycle_interventions,
        hemicycle_short_interventions: deputy["hemicycle_interventions_courtes"] - global_activity.hemicycle_short_interventions,
        written_proposals: deputy["propositions_ecrites"] - global_activity.written_proposals,
        signed_proposals: deputy["propositions_signees"] - global_activity.signed_proposals,
        oral_questions: deputy["questions_ecrites"] - global_activity.oral_questions,
        written_questions: deputy["questions_orales"] - global_activity.written_questions,
        reports: deputy["rapports"] - global_activity.reports,
        presence: deputy["semaines_presence"] - global_activity.presence,
      )

      global_activity.update!(
        amendements_adopted: deputy["amendements_adoptes"],
        amendements_proposed: deputy["amendements_proposes"],
        amendements_signed: deputy["amendements_signes"],
        commission_interventions: deputy["commission_interventions"],
        commission_presences: deputy["commission_presences"],
        hemicycle_interventions: deputy["hemicycle_interventions"],
        hemicycle_short_interventions: deputy["hemicycle_interventions_courtes"],
        written_proposals: deputy["propositions_ecrites"],
        signed_proposals: deputy["propositions_signees"],
        oral_questions: deputy["questions_ecrites"],
        written_questions: deputy["questions_orales"],
        reports: deputy["rapports"],
        presence: deputy["semaines_presence"],
      )
    end
  end
end
