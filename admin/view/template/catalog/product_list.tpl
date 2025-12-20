<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?>
      <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

  <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
  <?php } ?>

  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
        <a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a>
        <a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a>
      </div>
    </div>

    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align:center;">
                <input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" />
              </td>
              <td class="center"><?php echo $column_image; ?></td>

              <td class="left">
                <?php if ($sort == 'pd.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?>
              </td>

              <!-- CATEGORY COLUMN -->
              <td class="left"><?php echo $column_category; ?></td>

              <td class="left">
                <?php if ($sort == 'p.model') { ?>
                  <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?>
              </td>

              <td class="left">
                <?php if ($sort == 'p.price') { ?>
                  <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?>
              </td>

              <td class="left">
                <?php if ($sort == 'p.cost') { ?>
                  <a href="<?php echo $sort_cost; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_cost; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_cost; ?>"><?php echo $column_cost; ?></a>
                <?php } ?>
              </td>

              <td class="left">
                <?php if ($sort == 'profit') { ?>
                  <a href="<?php echo $sort_profit; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_profit; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_profit; ?>"><?php echo $column_profit; ?></a>
                <?php } ?>
              </td>

              <td class="right">
                <?php if ($sort == 'p.quantity') { ?>
                  <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?>
              </td>

              <td class="left">
                <?php if ($sort == 'p.status') { ?>
                  <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                  <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?>
              </td>

              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>

          <tbody>
            <!-- FILTER ROW -->
            <tr class="filter">
              <td></td>
              <td></td>

              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>

              <td>
                <select name="filter_category_id">
                  <option value=""></option>
                  <?php foreach ($all_categories as $cat) { ?>
                    <option value="<?php echo $cat['category_id']; ?>" <?php echo ($cat['category_id'] == $filter_category_id) ? 'selected="selected"' : ''; ?>>
                      <?php echo $cat['path']; ?>
                    </option>
                  <?php } ?>
                </select>
              </td>

              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
              <td><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8" /></td>
              <td><input type="text" name="filter_cost" value="<?php echo $filter_cost; ?>" size="8" placeholder=">= 10" /></td>
              <td><input type="text" name="filter_profit" value="<?php echo $filter_profit; ?>" size="8" placeholder=">= 10" /></td>
              <td><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align:right;" /></td>

              <td>
                <select name="filter_status">
                  <option value="*"></option>
                  <option value="1" <?php echo ($filter_status === '1') ? 'selected="selected"' : ''; ?>><?php echo $text_enabled; ?></option>
                  <option value="0" <?php echo ($filter_status === '0') ? 'selected="selected"' : ''; ?>><?php echo $text_disabled; ?></option>
                </select>
              </td>

              <td class="right">
                <a onclick="filter();" class="button"><?php echo $button_filter; ?></a>
              </td>
            </tr>

            <!-- PRODUCTS -->
            <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
                <tr>
                  <td style="text-align:center;">
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" <?php echo $product['selected'] ? 'checked="checked"' : ''; ?> />
                  </td>

                  <td class="center">
                    <img src="<?php echo $product['image']; ?>" style="padding:1px;border:1px solid #DDD;" />
                  </td>

                  <td class="left"><?php echo $product['name']; ?></td>

                  <!-- CATEGORY PATHS -->
                  <td class="left">
                    <?php echo !empty($product['category_paths']) ? implode('<br />', $product['category_paths']) : ''; ?>
                  </td>

                  <td class="left"><?php echo $product['model']; ?></td>
                  <td class="left"><?php echo $product['price']; ?></td>
                  <td class="left"><?php echo $product['cost']; ?></td>
                  <td class="left"><?php echo $product['profit']; ?></td>

                  <td class="right"><?php echo $product['quantity']; ?></td>
                  <td class="left"><?php echo $product['status']; ?></td>

                  <td class="right">
                    <?php foreach ($product['action'] as $action) { ?>
                      [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                    <?php } ?>
                  </td>
                </tr>
              <?php } ?>
            <?php } else { ?>
              <tr>
                <td colspan="11" class="center"><?php echo $text_no_results; ?></td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>

      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>

<script type="text/javascript">
function filter() {
  var url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';

  $('input, select', '.filter').each(function() {
    if ($(this).val()) {
      url += '&' + $(this).attr('name') + '=' + encodeURIComponent($(this).val());
    }
  });

  location = url;
}
</script>

<?php echo $footer; ?>
