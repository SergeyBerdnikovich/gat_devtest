class Api::Internal::EvaluateTargetsController < ApplicationController
  def create
    if params_validator.valid?
      target_evaluator.evaluate

      render json: success_result
    else
      render json: error_result
    end
  end

  private

  def params_validator
    @params_validator ||= TargetParamsValidator.new(target_params)
  end

  def target_params
    params.permit(:country_code, :target_group_id, locations: [:id, :panel_size])
  end

  def target_evaluator
    @target_evaluator ||= Evaluators::TargetEvaluator.new(target_params)
  end

  def success_result
    { price: target_evaluator.price }
  end

  def error_result
    { errors: params_validator.errors.full_messages.to_sentence }
  end
end
