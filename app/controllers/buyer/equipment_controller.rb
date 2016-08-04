class Buyer::EquipmentController < Buyer::BaseController
  before_action :find_equipment, only: [:edit,:update,:show,:destroy]
  before_action :get_equipment_form_data, only: [:new, :create,:edit,:update]

  def index
  	@equipments = current_user.equipment.all.order('created_at desc').page(params[:page]).per(10)
  end

  def filter
    condition = []
    if params[:q]
      @equipments = current_user.equipment.where("description LIKE (?) OR name LIKE (?) OR identifier LIKE (?)", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").order('created_at desc').page(params[:page]).per(10)
    else
      @equipments = current_user.equipment.order('created_at desc').page(params[:page]).per(10)
    end
    render :index
  end

  def show
    redirect_to buyer_equipment_index_path
  end

end
