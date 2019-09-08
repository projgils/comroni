# frozen_string_literal: true

module HeadTagsHelper
  STATIC_META_TAG_VALUES = {
    'homepage' => { 
       'description' => 'In Ormoc is an online buying, selling, and advertising platform that aims to help further improve Ormoc\'s booming online industry.', 
       'keywords' => 'Ormoc City, Ormoc City Buy and Sell, Ormoc City Rentals, Ormoc City Online Advertising, Ormoc City Online Marketplace, Ormoc City Online Products and Services',
       'og:image' => '/images/hero_1.jpg'
     }
  }

  def render_head_tags_for(opt={})
    content_for :head do 
      concat build_title_tag(opt)
      concat build_meta_tags(opt)
    end
  end

  def build_meta_tags(opt)
    if opt[:type] == 'static' || opt[:type].blank?
      page = opt[:page] || 'homepage'
      build_static_meta_tags_for(page)
    elsif opt[:type] == 'dynamic'

    end
  end

  def build_static_meta_tags_for(page)
    tags = ''
    tag_values = STATIC_META_TAG_VALUES.slice(page)[page] if page.present?
    if not tag_values.blank?
      tag_values.each do |key, value|
        tags += content_tag :meta, nil, name: key, content: value
      end
    end
    tags.html_safe
  end

  def build_title_tag(opt)
    if opt[:type] == 'static' || opt[:type].blank?
      build_static_title_tag(opt)
    else
      build_dynamic_title_tag(opt)
    end
  end

  def build_static_title_tag(opt)
    title = opt[:title] || "In Ormoc - Buy, Sell, Advertise in Ormoc"
    content_tag :title, title
  end

  def build_dynamic_title_tag(opt)
    record = opt[:record] || nil
    case record.class.to_s
    when 'Page'
      title = "#{record.title} - In Ormoc"
    else
    end
    content_tag :title, title
  end
end
