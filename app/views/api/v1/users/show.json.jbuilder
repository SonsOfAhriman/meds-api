json.prescriptions @user.prescriptions do |prescription|
    json.extract! prescription, :prescription_name, :side_effects
end
