<?php echo $header; ?>
<?php if (isset($column_left)): ?>
<?php echo $column_left; ?>
<?php endif; ?>
<?php if (!version_compare(VERSION, '2', '>=')): ?>
<?php if ($success) { ?>
    <div class="success" style="margin-bottom: 0px;"><?php echo $success; ?></div>
    <script>
        setTimeout(function () {
            $('.success').slideUp();
        }, 2000);
    </script>
<?php } ?>
<?php if ($warning) { ?>
<div class="warning" style="margin-bottom: 0px;"><?php echo $warning; ?></div>
<script>
    setTimeout(function () {
        $('.warning').slideUp();
    }, 2000);
</script>
<?php } ?>
<?php endif; ?>
<div id="content" class="journal-content <?php echo version_compare(VERSION, '2', '>=') ? 'oc2' : ''; ?>" data-ng-controller="MainController">
<?php if (version_compare(VERSION, '2', '>=')): ?>
    <?php if ($success) { ?>
    <div class="alert alert-success" style="margin-bottom:0;"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
<?php endif; ?>
<div class="dummy-bg"> </div>
<nav>
    <div class="sticky">
        <a class="set-menu" href="<?php echo $base_href;?>#/home"><div class="logo">Journal <small>v.<?php echo JOURNAL_VERSION; ?></small></div></a>
    </div>
    <ul id="nav">
        <li class="divider">Control Panel</li>
        <li class="first-li cp">
            <a class="set-menu" href="<?php echo $base_href;?>#/settings/general/{{getActiveSkin()}}" data-icon='&#xe094;'>Settings</a>
            <ul data-icon='&#xe61f;'>
                <li>
                    <a href="<?php echo $base_href;?>#/settings/general/{{getActiveSkin()}}" data-icon='&#xe094;'>Global</a>
                    <ul data-icon='&#xe61f;'>
                        <li><a href="<?php echo $base_href;?>#/settings/general/{{getActiveSkin()}}">General</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/pages/{{getActiveSkin()}}">Pages</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/journalcheckout/{{getActiveSkin()}}">Quick Checkout</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/productlabels/{{getActiveSkin()}}">Product Labels</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/countdown/{{getActiveSkin()}}">Countdown</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/notification/{{getActiveSkin()}}">Notification</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/quickview/{{getActiveSkin()}}">Quickview</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/welcome/{{getActiveSkin()}}">Welcome Module</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<?php echo $base_href;?>#/settings/header/{{getActiveSkin()}}" data-icon='&#xe094;'>Header</a>
                    <ul data-icon='&#xe61f;'>
                        <li><a href="<?php echo $base_href;?>#/settings/header/{{getActiveSkin()}}">General</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/headermenus/{{getActiveSkin()}}">Menus</a></li>
                    </ul>
                </li>
                <li><a href="<?php echo $base_href;?>#/settings/footer/{{getActiveSkin()}}">Footer</a></li>
                <li>
                    <a href="<?php echo $base_href;?>#/settings/blog/{{getActiveSkin()}}" data-icon='&#xe094;'>Blog</a>
                    <ul data-icon='&#xe61f;'>
                        <li><a href="<?php echo $base_href;?>#/settings/blog/{{getActiveSkin()}}">General</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/blogpostpage/{{getActiveSkin()}}">Post Page</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/blogmodules/{{getActiveSkin()}}">Blog Modules</a></li>
                        <li><a href="<?php echo $base_href;?>#/settings/bloglanguage/{{getActiveSkin()}}">Blog Language</a></li>
                    </ul>
                </li>

                <li>
                    <a href="<?php echo $base_href;?>#/settings/moduleslider/{{getActiveSkin()}}" data-icon='&#xe094;'>Modules</a>
                    <ul data-icon='&#xe61f;'>
                        <span class="module-menus">
                            <li><a href="<?php echo $base_href;?>#/settings/moduleslider/{{getActiveSkin()}}">Slider</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulecarousel/{{getActiveSkin()}}">Carousel</a></li>
<!--                            <li><a href="--><?php //echo $base_href;?><!--#/settings/modulestaticbanners/{{getActiveSkin()}}">Banners</a></li>-->
                            <li><a href="<?php echo $base_href;?>#/settings/modulecustomsections/{{getActiveSkin()}}">Custom Sections</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulecmsblocks/{{getActiveSkin()}}">CMS Blocks</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulesuperfilter/{{getActiveSkin()}}">Super Filter</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/moduleproducttabs/{{getActiveSkin()}}">Enquiry Button</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/moduleflyout/{{getActiveSkin()}}">Flyout Menu</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/moduletextrotator/{{getActiveSkin()}}">Text Rotator</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/moduleheadlinerotator/{{getActiveSkin()}}">Headline Rotator</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulenewsletter/{{getActiveSkin()}}">Newsletter</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulephotogallery/{{getActiveSkin()}}">Photo Gallery</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/modulepopup/{{getActiveSkin()}}">Popup</a></li>
                            <li><a href="<?php echo $base_href;?>#/settings/moduleaccordion/{{getActiveSkin()}}">Accordion</a></li>
                        </span>
                    </ul>
                </li>
                <li><a href="<?php echo $base_href;?>#/settings/productgrid/{{getActiveSkin()}}">Product Grid</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/productlist/{{getActiveSkin()}}">Product List</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/productpage/{{getActiveSkin()}}">Product Page</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/category/{{getActiveSkin()}}">Category Page</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/sidecolumn/{{getActiveSkin()}}">Side Column</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/catalog/{{getActiveSkin()}}">Catalog Mode</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/custom_code/{{getActiveSkin()}}">Custom Code</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/system">System & Performance</a></li>
                <li><a href="<?php echo $base_href;?>#/settings/import_export">Import / Export</a></li>
            </ul>
        </li>
        <li class="cp">
            <a class="menu-menu" href="<?php echo $base_href;?>#/menus/primary" data-icon='&#xe094;' >Menus</a>
            <ul data-icon='&#xe61f;'>
                <li><a href="<?php echo $base_href;?>#/menus/primary">Top Menu</a></li>
                <li><a href="<?php echo $base_href;?>#/menus/secondary">Secondary Menu</a></li>
                <li><a href="<?php echo $base_href;?>#/menus/main">Main Menu</a></li>
            </ul>
        </li>
        <li class="cp">
            <a class="foot-menu" href="<?php echo $base_href;?>#/footer/menu" data-icon='&#xe094;' >Footer</a>
            <ul data-icon='&#xe61f;'>
                <li><a href="<?php echo $base_href;?>#/footer/menu">Menu</a></li>
                <li><a href="<?php echo $base_href;?>#/footer/copyright">Copyright</a></li>
                <li><a href="<?php echo $base_href;?>#/footer/payments">Payments</a></li>
            </ul>
        </li>
        <li class="cp">
            <a class="bs-menu" href="<?php echo $base_href;?>#/blog/settings" data-icon='&#xe094;' >Blog</a>
            <ul data-icon='&#xe61f;'>
                <li><a href="<?php echo $base_href;?>#/blog/settings">General</a></li>
                <!--<li><a href="<?php echo $base_href;?>#/blog/authors">Authors</a></li>-->
                <li><a href="<?php echo $base_href;?>#/blog/posts">Blog Posts</a></li>
                <li><a href="<?php echo $base_href;?>#/blog/categories">Blog Categories</a></li>
                <li><a href="<?php echo $base_href;?>#/blog/comments">Blog Comments</a></li>
            </ul>
        </li>
        <li class="divider">Modules</li>
        <li>
            <a class="blog-menu" href="<?php echo $base_href;?>#/module/blog_categories/all" data-icon='&#xe094;'>Blog Modules</a>
            <ul data-icon='&#xe61f;'>
                <li><a href="<?php echo $base_href;?>#/module/blog_posts/all">Posts Module</a></li>
                <li><a href="<?php echo $base_href;?>#/module/blog_side_posts/all">Side Posts</a></li>
                <li><a href="<?php echo $base_href;?>#/module/blog_categories/all">Category</a></li>
                <li><a href="<?php echo $base_href;?>#/module/blog_comments/all">Comments</a></li>
                <li><a href="<?php echo $base_href;?>#/module/blog_search/all">Search</a></li>
                <li><a href="<?php echo $base_href;?>#/module/blog_tags/all">Tags</a></li>
            </ul>
        </li>
        <li>
            <a class="slide-menu" href="<?php echo $base_href;?>#/module/simple_slider/all" data-icon='&#xe094;'>Slider</a>
            <ul data-icon='&#xe61f;'>
                <li><a href="<?php echo $base_href;?>#/module/simple_slider/all">Journal</a></li>
                <li><a href="<?php echo $base_href;?>#/module/slider/all">Revolution</a></li>
            </ul>
        </li>
        <li>
            <a class="b-menu" href="<?php echo $base_href;?>#/module/static_banners/all">Banners</a>
        </li>
        <li>
            <a class="car-menu" href="<?php echo $base_href;?>#/module/carousel/all">Carousel</a>
        </li>
        <li>
            <a class="cs-menu" href="<?php echo $base_href;?>#/module/custom_sections/all">Custom Sections</a>
        </li>
        <li>
            <a class="cms-menu" href="<?php echo $base_href;?>#/module/cms_blocks/all">CMS Blocks</a>
        </li>
        <li>
            <a class="sf-menu" href="<?php echo $base_href;?>#/module/super_filter/all">Super Filter</a>
        </li>
        <li>
            <a class="sc-menu" href="<?php echo $base_href;?>#/module/side_category/all">Side Category</a>
        </li>
        <li>
            <a class="fm-menu" href="<?php echo $base_href;?>#/module/side_column_menu/all">Flyout Menu</a>
        </li>
        <li>
            <a class="sp-menu" href="<?php echo $base_href;?>#/module/side_products/all">Side Products</a>
        </li>
        <li>
            <a class="hn-menu" href="<?php echo $base_href;?>#/module/header_notice/all">Header Notice</a>
        </li>
        <li>
            <a class="tr-menu" href="<?php echo $base_href;?>#/module/text_rotator/all">Text Rotator</a>
        </li>
        <li>
            <a class="hr-menu" href="<?php echo $base_href;?>#/module/headline_rotator/all">Headline Rotator</a>
        </li>
        <li>
            <a class="pg-menu" href="<?php echo $base_href;?>#/module/photo_gallery/all">Photo Gallery</a>
        </li>
        <li>
            <a class="sb-menu" href="<?php echo $base_href;?>#/module/side_blocks/all">Side Blocks</a>
        </li>
        <li>
            <a class="fs-menu" href="<?php echo $base_href;?>#/module/fullscreen_slider/all">Fullscreen Slider</a>
        </li>
        <li><a class="pt-menu" href="<?php echo $base_href;?>#/module/product_tabs/all">Product Tabs / Blocks</a>
        </li>
        <li>
            <a class="multimod" href="<?php echo $base_href;?>#/module/advanced_grid/all">Advanced Grid</a>
        </li>

        <li>
            <a class="newslet" href="<?php echo $base_href;?>#/module/newsletter/all">Newsletter</a>
        </li>
        <li>
            <a class="pop" href="<?php echo $base_href;?>#/module/popup/all">Popup</a>
        </li>
        <li>
            <a class="accordion" href="<?php echo $base_href;?>#/module/accordion/all">Accordion</a>
        </li>
    </ul>
</nav>

<div class="dummy-module-header"> </div>

<div class="journal-loading"><span>Loading...</span></div>
<div class="border-top"> </div>
<div class="journal-body" id="journal-body" data-ng-view>
<div></div>
</div>

<div style="clear: both"></div>

</div>

<script>
    var Journal2Config = $.parseJSON('<?php echo addslashes(json_encode($journal2_config)); ?>');
</script>

<?php if(defined('J2ENV') && J2ENV === 'development'): ?>
<script src="view/journal2/lib/require/require.js?<?php echo JOURNAL_VERSION; ?>" data-main="view/journal2/js/main.js?<?php echo JOURNAL_VERSION; ?>"></script>
<?php else: ?>
<script src="view/journal2/lib/require/require.js?<?php echo JOURNAL_VERSION; ?>"></script>
<script src="view/journal2/journal.js?<?php echo JOURNAL_VERSION; ?>"></script>
<?php endif; ?>

<?php if (version_compare(VERSION, '2', '>=')): ?>
<script>$('html').addClass('oc2');</script>
<?php endif; ?>

<?php if (version_compare(VERSION, '3', '>=')): ?>
<script>$('html').addClass('oc3');</script>
<?php endif; ?>

<?php echo $footer; ?>

