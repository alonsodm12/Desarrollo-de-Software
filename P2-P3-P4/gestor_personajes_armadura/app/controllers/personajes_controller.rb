class PersonajesController < ApplicationController
    def index
        @personajes = Personaje.all
        # @personajes = Personaje.where(usuario: params[:usuario])
        logger.info "Cargando personajes para usuario: #{params[:usuario]}, Total: #{@personajes.count}"
        render json: @personajes
    end

    def create
        armadura = Armadura.find_or_create_by(armadura_params)
        @personaje = Personaje.new(personaje_params.except(:armadura))
        @personaje.armadura = armadura
        if @personaje.save
            render json: @personaje, status: :created
        else
            render json: @personaje.errors, status: :unprocessable_entity
        end
    end    

    def update
        @personaje = Personaje.find(params[:id])

        if params[:personaje].present? && params[:personaje][:armadura].present?
            armadura = Armadura.find_or_create_by(armadura_params)
            @personaje.armadura = armadura
        end

        if @personaje.update(personaje_params.except(:armadura))
            render json: @personaje
        else
            render json: @personaje.errors, status: :unprocessable_entity
        end
    end

    def destroy
        personaje = Personaje.find(params[:id])
        if personaje.destroy
          head :ok
        else
          render json: { error: "Failed to delete" }, status: :unprocessable_entity
        end
    end

    private

    def personaje_params
        params.require(:personaje).permit(:arma, :habilidad, :tipoPersonaje, :usuario, armadura: [:tipo])
    end

    def armadura_params
        params.require(:personaje).require(:armadura).permit(:tipo)
    end
end
