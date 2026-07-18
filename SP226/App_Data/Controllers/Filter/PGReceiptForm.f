<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PGReceipt">
  <!ENTITY DetailTable "d96">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">

]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phiếu nhập mua" e="Purchase Receipt"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>%mp6eznZa11PdGfCdIfJZVm5Ou6fR7iCNVZ6RB7O/yDIe2gXVITH8pO8JBar+axPU</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+MFSpcvf3CI1ANcjEN9u3tvMQGRiZcdUxCinBc5oydDEg6GJBvWTO7v3ogCthD8LsxNidUCpYgQM5lcMYcbXTLcwQm0SjwXiLGgsvzS3Rv7O2qlokNUtzJ16wnYFkQjBk1fuh/mZjsgM5TOZto/DGiNvBKX/DDdL378xoRdt1CBJNLhVGsZrJwWHpI/HuyozHrbs0Iu/u29t7AhqFzt9yBio//Ro3hNRnH5X7/sjtR8W2OS1feaeFT9awynrc2POkJlU/7gVnp/dTzSBlDwKpHvlZUR7viq7PTNEsVEVJW4oLpsF0UQInHWzu9knJkvpLtxJFpHFGpqh6KB9Tvb3RUlZiCV97MKY1UpOSfQkWdEl7jQIg5vXd5pvQEN/JzYJNIG8euGPtfRogkdN3DuiWN6gUMwe+dIa8OR1TQysyTso5GYMupzjiwucFtzkSaO07Vi8sgdOZ31eH6oTXAUKyYA==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>%bTwx6BwczM9aR7zqTp36M9d18qwxAo1FWFSWnP3O7YccM0Sar8VRdcaMhBcSSBmyZ3uQhFxdrTBPOJzry792YWmMujDpW7fNL4UXzXsYWbwrGj7PP5BYw07dCDWnIOwxvjuI59uebZclSBt4YSbeEq39zZG+W/P0OoXq0WQXU9Q5GsCvMn89Hei/9OZDO423WZ96SBlQgHGMhiyoLxIYmYqckLibl5z40P43SPfG2LZAaEIwP1I772Xu/uhPA+Zar/ZPfbIxzP6v0Pve7thg+4TkcW+2ugTjisZrQYCx8FOi61Ar2YvAm+2coy3+tYTUpszw0ikyq+eOXRZT0LhvW+KMUd+uZDYLOJhLHfKybQy8PgsDkvWP/toyQfO+Afyp+zl7tQgNV3cu7dASRJs2AJe7LxDMH6yZDpT1i8nJ7nN6FKMeWi7BllFBn9+EmlTrpUZCDc1Cyy6Yg8lomyP8jVo3PuXtbwcUgOLnSuo0xMqXEvEnKTndZZDneYx5MgW+pou6MBbSWlPf2/cz/dV5BlpG0QwIfYKLeIYzVMwMXLxoYKJdLpmy8p5HljOVc8nGGv4H+GbmJVxgwPiZ/rV4vje5Cg+lNxZsNMGP1hvItsYtmHUlrE9/QJKDbpXQfKpB62tCXxdSI886LRdE1Epm5kQ5VRw6+SNa4kZ39mz32f4k3RUorkNM3m9HWBHZFvOg</encrypted>]]>
    </text>
  </script>
</dir>
