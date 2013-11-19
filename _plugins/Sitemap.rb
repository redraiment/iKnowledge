require 'rexml/document'

module IKnowledge
  class SitemapPage < Jekyll::StaticFile
    def write(dest)
      begin
        super(dest)
      rescue
      end

      true
    end
  end
  
  class SitemapGenerator < Jekyll::Generator
    def generate(site)
      @host = 'http://' + site.data['blog']['url']

      sitemap = REXML::Document.new << REXML::XMLDecl.new("1.0", "UTF-8")
      sitemap.add_element(fill_urlset(site))

      Dir::mkdir(site.dest) if !File.directory? site.dest
      filename = 'sitemap.xml'
      file = File.new(File.join(site.dest, filename), 'w')
      formatter = REXML::Formatters::Pretty.new(2)
      formatter.compact = true
      formatter.write(sitemap, file)
      file.close

      site.static_files << SitemapPage.new(site, site.dest, "/", filename)
    end
    
    def fill_urlset(site)
      urlset = REXML::Element.new "urlset"
      urlset.add_attribute("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9")
      urlset.add_attribute("xmlns:image", "http://www.google.com/schemas/sitemap-image/1.1")

      fill_url(site.posts, urlset)
      fill_url(site.pages, urlset)

      urlset
    end

    def fill_url(pages, root)
      pages.each do |page|
        if page.url.end_with? '.html', '/'
          url = REXML::Element.new "url"

          loc = REXML::Element.new "loc"
          loc.text = @host + page.url.sub(/index\.html$/, '')
          url.add_element(loc)

          lastmod = REXML::Element.new "lastmod"
          mtime = File.exist?(page.path) ? File.mtime(page.path) : Time.now
          lastmod.text = mtime.iso8601
          url.add_element(lastmod)

          fill_image(page, url)
          
          root.add_element(url)
        end
      end
    end

    def fill_image(page, root)
      page.content.scan(/\{% img\s+(\S+)/).each do |(img)|
        image = REXML::Element.new "image:image"

        loc = REXML::Element.new "image:loc"
        loc.text = "#@host/resource#{page.url}#{img}"
        image.add_element(loc)

        root.add_element(image)
      end
    end
  end
end
