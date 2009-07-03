module UbiquoMedia
  module Connectors
    class Standard < Base
      
      
      module Asset
        
        def self.included(klass)
          klass.send(:extend, ClassMethods)
        end
        
        module ClassMethods
          # Applies any required extra scope to the filtered_search method
          def uhook_filtered_search
            yield
          end
        end
        
      end
      
#      module AssetRelation
#        
#        def self.included(klass)
##          klass.send(:extend, ClassMethods)
##          klass.send(:include, InstanceMethods)
#        end
#        
##        module ClassMethods
##          # Applies any required extra scope to the filtered_search method
##          def uhook_filtered_search
##            yield
##          end
##        end
##        
#      end
      
#      
#      module UbiquoComponentsController
#        def self.included(klass)
#          klass.send(:include, InstanceMethods)
#        end
#        module InstanceMethods
#          
#          # returns the component for the lightwindow. 
#          # Will be rendered in their ubiquo/_form view
#          def uhook_find_component
#            @component = Component.find(params[:id])
#          end
#          
#          # modify the created component and return it. It's executed in drag-drop.
#          def uhook_prepare_component(component)
#            component
#         end
#          
#          # Destroys a component
#          def uhook_destroy_component(component)
#            component.destroy
#          end
#          
#          # updates a component. 
#          # Fields can be found in params[:component] and component_id in params[:id]
#          # must returns the updated component
#          def uhook_update_component
#            component = Component.find(params[:id])
#            params[:component].each do |field, value|
#              component.send("#{field}=", value)
#            end
#            component.save
#            component
#          end
#          
#        end
#      end
#
#      module UbiquoMenuItemsController
#        def self.included(klass)
#          klass.send(:include, InstanceMethods)
#        end
#        module InstanceMethods
#          
#          # gets Menu items instances for the list and return it
#          def uhook_find_menu_items
#            MenuItem.roots
#          end
#          
#          # initialize a new instance of menu item
#          def uhook_new_menu_item
#            MenuItem.new(:parent_id => (params[:parent_id] || 0), :is_active => true)
#          end
#          
#          # creates a new instance of menu item
#          def uhook_create_menu_item
#            mi = MenuItem.new(params[:menu_item])
#            mi.save
#            mi
#          end
#          
#          #updates a menu item instance. returns a boolean that means if update was done.
#          def uhook_update_menu_item(menu_item)
#            menu_item.update_attributes(params[:menu_item])
#          end
#          
#          #destroys a menu item instance. returns a boolean that means if destroy was done.
#          def uhook_destroy_menu_item(menu_item)
#            menu_item.destroy
#          end
#
#          # loads all automatic menu items
#          def uhook_load_automatic_menus
#            AutomaticMenu.find(:all, :order => 'name ASC')  
#          end
#        end
#      end
#
      module UbiquoAssetsController
        def self.included(klass)
          klass.send(:include, InstanceMethods)
          klass.send(:helper, Helper)
        end
        
        module Helper
#          def uhook_page_actions(page)
#            [
#              link_to(t('ubiquo.edit'), edit_ubiquo_page_path(page)),
#              link_to(t('ubiquo.design.design'), ubiquo_page_design_path(page)),
#              link_to(t('ubiquo.remove'), [:ubiquo, page], :confirm => t('ubiquo.design.confirm_page_removal'), :method => :delete)
#            ]
#          end
#          
#          def uhook_edit_sidebar
#            ""
#          end
#          def uhook_new_sidebar
#            ""
#          end
#          def uhook_form_top(form)
#            ""
#          end
        end
        module InstanceMethods
          
          # Returns a hash with extra filters to apply
          # 
          #   params: params hash from the controller
          #
          def uhook_index_filters(params)
            {}
          end
          
          # initializes a new instance of asset.
          def uhook_new_asset
            ::Asset.new
          end
#          
#          # create a new instance of page.
#          def uhook_create_page
#            p = ::Page.new(params[:page])
#            p.save
#            p
#          end
#         
#          #updates a page instance. returns a boolean that means if update was done.
#          def uhook_update_page(page)
#            page.update_attributes(params[:page])
#          end
#
#          #destroys a page isntance. returns a boolean that means if the destroy was done.
#          def uhook_destroy_page(page)
#            page.destroy
#          end
        end
      end
      
      module Migration
        
        def self.included(klass)
          klass.send(:extend, ClassMethods)
        end
        
        module ClassMethods
          def uhook_create_assets_table
            create_table :assets do |t|
              yield t
            end
          end
        end
      end
      
    end
  end
end
