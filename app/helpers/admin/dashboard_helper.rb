module Admin::DashboardHelper

  def scaffold_content_tag(column)
    column.blank? ? '-' : column
  end
end
