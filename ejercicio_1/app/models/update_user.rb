def update_user(user_data)
  begin
    if !user_data[:id].nil?
      user = User.find(user_id)
    else
      user = User.new
    end

    if !user.save
      return false
    end

    if user_role.present? && process_id.present? && user_id.present?
      user_role_process_data = UserRoleProcess.where(user_id: user_id, role_id: user_role, enterprise_process_id: process_id)
      if user_role_process_data.empty?
        status = UserRoleProcess.create(user_id: user_id, role_id: user_role.to_i, enterprise_process_id: process_id.to_i)
      end
    end
    if area_id.present?
      user_area = UserEnterpriseArea.where(user_id: user_id, enterprise_area_id: area_id.to_i).first
      unless user_area.present?
        status = UserEnterpriseArea.create(user_id: user_id, enterprise_area_id: area_id.to_i)
      end
    end

    return true
  rescue Exception => e
    #Manejo de excepción
  end
end
