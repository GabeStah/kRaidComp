class SpellsController < ApplicationController
  def index
    #PopulateSpells.populate('config/spells.json')
    respond_to do |format|
      format.html
      format.json { render json: SpellDatatable.new(view_context) }
    end
  end
end