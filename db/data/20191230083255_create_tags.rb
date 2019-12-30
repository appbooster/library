class CreateTags < ActiveRecord::Migration[6.0]
  def up
    tags = %w[разработка продукт маркетинг продажи
              управление мотивация тайм-менеджмент психология
              биография hr дизайн контент стратегия]
    tags.each do |name|
      Tag.create(name: name)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
