class SpellDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate

  def_delegators :@view, :l, :link_to

  def initialize(view, options = {})
    @view = view
    super(@view, @options)
  end

  def sortable_columns
    @sortable_columns ||= ['spells.id, spells.name']
  end

  def searchable_columns
    @searchable_columns ||= ['spells.id, spells.name']
  end

  private

  def data
    records.map do |spell|
      [
          spell.id,
          link_to(spell.name, "http://wod.wowhead.com/spell=#{spell.id}"),
          spell.effects.size > 0 ? spell.effects.first.name : ''
      ]
    end
  end

  def get_raw_records
    Spell.eager_load(:effects)
  end
end
