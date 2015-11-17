class QuestionnaireController < ApplicationController
	def index
	end

	def questionnaire_result
		@risk = params[:risk]
		@availability = params[:availability]
		@profitability = params[:profitability]
	end

	def user_investment_profile
		@risk = params[:risk]
		@availability = params[:availability]
		@profitability = params[:profitability]

		user_risk = @risk
		user_availability = @availability
		user_profitability = @profitability

		conservative_quantity = 0
		moderate_quantity = 0
		dynamic_quantity = 0
		bold_quantity = 0

		risk_vector = ["Baixo", "Médio", "Médio", "Médio", "Médio", "Alto", "Alto"]
		time_availability_vector = ["Curto", "Curto", "Médio", "Médio", "Longo", "Médio", "Longo"]
		profitability_vector = ["Baixo", "Médio", "Médio", "Alto", "Alto", "Alto", "Alto"]
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

		conservative_probability = (profile_quantity_array[0]/profile_vector_length.to_f).round(3)
		moderate_probability = (profile_quantity_array[1]/profile_vector_length.to_f).round(3)
		dynamic_probability = (profile_quantity_array[2]/profile_vector_length.to_f).round(3)
		bold_probability = (profile_quantity_array[3]/profile_vector_length.to_f).round(3)

		probability_profile_array = [conservative_probability, moderate_probability, dynamic_probability, bold_probability]

		if user_risk == "Baixo"
			probability_with_conservative_risk = (1.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_risk = (0.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_risk = (0.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_risk = (0.to_f/profile_quantity_array[3]).round(3)
		elsif user_risk == "Médio"
			probability_with_conservative_risk = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_risk = (2.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_risk = (2.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_risk = (0.to_f/profile_quantity_array[3]).round(3)
		elsif user_risk == "Alto"
			probability_with_conservative_risk = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_risk = (0.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_risk = (0.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_risk = (2.to_f/profile_quantity_array[3]).round(3)
		end
		
		if user_availability == "Curto"
			probability_with_conservative_availability = (1.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_availability = (1.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_availability = (0.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_availability = (0.to_f/profile_quantity_array[3]).round(3)
		elsif user_availability == "Médio"
			probability_with_conservative_availability = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_availability = (1.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_availability = (1.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_availability = (1.to_f/profile_quantity_array[3]).round(3)
		elsif user_availability == "Longo"
			probability_with_conservative_availability = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_availability = (0.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_availability = (1.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_availability = (1.to_f/profile_quantity_array[3]).round(3)
		end

		if user_profitability == "Baixo"
			probability_with_conservative_profitability = (1.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_profitability = (0.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_profitability = (0.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_profitability = (0.to_f/profile_quantity_array[3]).round(3)
		elsif user_profitability == "Médio"
			probability_with_conservative_profitability = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_profitability = (2.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_profitability = (0.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_profitability = (0.to_f/profile_quantity_array[3]).round(3) 
		elsif user_profitability == "Alto"
			probability_with_conservative_profitability = (0.to_f/profile_quantity_array[0]).round(3)
			probability_with_moderate_profitability = (0.to_f/profile_quantity_array[1]).round(3)
			probability_with_dynamic_profitability = (2.to_f/profile_quantity_array[2]).round(3)
			probability_with_bold_profitability = (2.to_f/profile_quantity_array[3]).round(3)
		end

		probability_with_first_profile = (probability_with_conservative_risk * probability_with_conservative_availability * probability_with_conservative_profitability).round(3)
		probability_with_second_profile = (probability_with_moderate_risk * probability_with_moderate_availability * probability_with_moderate_profitability).round(3)
		probability_with_third_profile = (probability_with_dynamic_risk * probability_with_dynamic_availability * probability_with_dynamic_profitability).round(3)
		probability_with_fourth_profile = (probability_with_bold_risk * probability_with_bold_availability * probability_with_bold_profitability).round(3)

		first_probability = (probability_with_first_profile * probability_profile_array[0]).round(3)
		second_probability = (probability_with_second_profile * probability_profile_array[1]).round(3)
		third_probability = (probability_with_third_profile * probability_profile_array[2]).round(3)
		fourth_probability = (probability_with_fourth_profile * probability_profile_array[3]).round(3)
		
		@probability_one = first_probability
		@probability_two = second_probability
		@probability_three = third_probability
		@probability_four = fourth_probability
	end
end
end