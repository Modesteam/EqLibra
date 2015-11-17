class QuestionnaireController < ApplicationController
	def index
	end

	def questionnaire_result
		@risk = params[:risk]
		@availability = params[:availability]
		@profitability = params[:profitability]
	end

	def calculate_profiles_quantity
		conservative_quantity = 0
		moderate_quantity = 0
		dynamic_quantity = 0
		bold_quantity = 0

		#risk_vector = ["Baixo", "Médio", "Médio", "Médio", "Médio", "Alto", "Alto"]
		#time_availability_vector = ["Curto", "Curto", "Médio", "Médio", "Longo", "Médio", "Longo"]
		#profitability_vector = ["Baixo", "Médio", "Médio", "Alto", "Alto", "Alto", "Alto"]
		investment_profile_vector = ["Conservador", "Moderado", "Moderado", "Dinâmico", "Dinâmico", "Arrojado", "Arrojado"]

		profile_vector_length = investment_profile_vector.length

		investment_profile_vector.each do |element|
		if element == "Conservador"
			conservative_quantity += 1
		elsif element == "Moderado"
			moderate_quantity += 1
		elsif element == "Dinâmico"
			dynamic_quantity += 1
		elsif element == "Arrojado"
			bold_quantity += 1
		end

		profile_quantity_array = [conservative_quantity, moderate_quantity, dynamic_quantity, bold_quantity]

		return profile_quantity_array
	end

	def calculate_profile_probability

		profile_quantity = calculate_profiles_quantity

		conservative_probability = (conservative_quantity/profile_quantity[0].to_f).round(3)
		moderate_probability = (moderate_quantity/profile_quantity[1].to_f).round(3)
		dynamic_probability = (dynamic_quantity/profile_quantity[2].to_f).round(3)
		bold_probability = (bold_quantity/profile_quantity[3].to_f).round(3)

		probability_profile_array = [conservative_probability, moderate_probability, dynamic_probability, bold_probability]

		return probability_profile_array
	end

	def classify_risk_with_profile(risk)
		profile_quantity = calculate_profiles_quantity

		if risk == "Baixo"
			probability_with_conservative_risk = (1.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_risk = (0.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_risk = (0.to_f/profile_quantity[2]).round(3)
			probability_with_bold_risk = (0.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_risk, probability_with_moderate_risk, probability_with_dynamic_risk, probability_with_bold_risk]
			return result_array
		elsif risk == "Médio"
			probability_with_conservative_risk = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_risk = (2.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_risk = (2.to_f/profile_quantity[2]).round(3)
			probability_with_bold_risk = (0.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_risk, probability_with_moderate_risk, probability_with_dynamic_risk, probability_with_bold_risk]
			return result_array
		elsif risk == "Alto"
			probability_with_conservative_risk = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_risk = (0.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_risk = (0.to_f/profile_quantity[2]).round(3)
			probability_with_bold_risk = (2.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_risk, probability_with_moderate_risk, probability_with_dynamic_risk, probability_with_bold_risk]
			return result_array
		end
	end

	def classify_availability_with_profile(availability)
		profile_quantity = calculate_profiles_quantity
		
		if availability == "Curto"
			probability_with_conservative_availability = (1.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_availability = (1.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_availability = (0.to_f/profile_quantity[2]).round(3)
			probability_with_bold_availability = (0.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_availability, probability_with_moderate_availability, probability_with_dynamic_availability, probability_with_bold_availability]
			return result_array
		elsif availability == "Médio"
			probability_with_conservative_availability = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_availability = (1.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_availability = (1.to_f/profile_quantity[2]).round(3)
			probability_with_bold_availability = (1.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_availability, probability_with_moderate_availability, probability_with_dynamic_availability, probability_with_bold_availability]
			return result_array
		elsif availability == "Longo"
			probability_with_conservative_availability = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_availability = (0.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_availability = (1.to_f/profile_quantity[2]).round(3)
			probability_with_bold_availability = (1.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_availability, probability_with_moderate_availability, probability_with_dynamic_availability, probability_with_bold_availability]
			return result_array
		end
	end

	def classify_profitability_with_profile(profitability)
		profile_quantity = calculate_profiles_quantity

		if profitability == "Baixo"
			probability_with_conservative_profitability = (1.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_profitability = (0.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_profitability = (0.to_f/profile_quantity[2]).round(3)
			probability_with_bold_profitability = (0.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_profitability, probability_with_moderate_profitability, probability_with_dynamic_profitability, probability_with_bold_profitability]
			return result_array
		elsif profitability == "Médio"
			probability_with_conservative_profitability = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_profitability = (2.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_profitability = (0.to_f/profile_quantity[2]).round(3)
			probability_with_bold_profitability = (0.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_profitability, probability_with_moderate_profitability, probability_with_dynamic_profitability, probability_with_bold_profitability]
			return result_array
		elsif profitability == "Alto"
			probability_with_conservative_profitability = (0.to_f/profile_quantity[0]).round(3)
			probability_with_moderate_profitability = (0.to_f/profile_quantity[1]).round(3)
			probability_with_dynamic_profitability = (2.to_f/profile_quantity[2]).round(3)
			probability_with_bold_profitability = (2.to_f/profile_quantity[3]).round(3)
			result_array = [probability_with_conservative_profitability, probability_with_moderate_profitability, probability_with_dynamic_profitability, probability_with_bold_profitability]
			return result_array
		end
	end

	def calculate_intermediate_probability
		risk = @risk
		availability = @availability
		profitability = @profitability

		array_one = classify_risk_with_profile(risk)
		array_two = classify_availability_with_profile(availability)
		array_three = classify_profitability_with_profile(profitability)

		probability_with_first_profile = (array_one[0] * array_two[0] * array_three[0]).round(3)
		probability_with_second_profile = (array_one[1] * array_two[1] * array_three[1]).round(3)
		probability_with_third_profile = (array_one[2] * array_two[2] * array_three[2]).round(3)
		probability_with_fourth_profile = (array_one[3] * array_two[3] * array_three[3]).round(3)

		intermediate_probability_array = [probability_with_first_profile, probability_with_second_profile, probability_with_third_profile, probability_with_fourth_profile]

		return intermediate_probability_array
	end

	def calculate_final_probability
		profile_probability = calculate_profile_probability
		intermediate_probability = calculate_intermediate_probability

		first_probability = (intermediate_probability[0] * profile_probability[0]).round(3)
		second_probability = (intermediate_probability[1] * profile_probability[1]).round(3)
		third_probability = (intermediate_probability[2] * profile_probability[2]).round(3)
		fourth_probability = (intermediate_probability[3] * profile_probability[3]).round(3)

		final_probability = [first_probability, second_probability, third_probability, fourth_probability]
		return final_probability
	end

	def user_investment_profile
		probability = calculate_final_probability
		
		@probability_one = probability[0]
		@probability_two = probability[1]
		@probability_three = probability[2]
		@probability_four = probability[3]
	end
end
end