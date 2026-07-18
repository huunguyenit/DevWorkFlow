<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identity "LimitReportFormRightFormDetail">
]>

<grid table="sysreportformidright2" code="user_id, controller, form_id" order="form_id" type="Detail" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="user_id" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="controller" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="form_id" isPrimaryKey="true" width="100" allowNulls="false" aliasName="a">
      <header v="Mẫu in" e="Template"></header>
    </field>
    <field name="header%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mẫu in" e="Description"></header>
    </field>
    <field name="r_limit" type="Boolean" width="60" aliasName="a">
      <header v="&lt;div id='FormGridTagId' onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:-1px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Giới hạn&lt;/div&gt;" e="&lt;div id='ReportGridTagId' onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Deny&lt;/div&gt;"></header>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="controller"/>
      <field name="form_id"/>
      <field name="header%l"/>
      <field name="r_limit"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKawjuGyDK4/Fa1yGUZl4UVEWfwId6lMXYwFbJ1iU7rzOQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERhojv7Xfvk2XL5ToFSIrVRWWDmA6JY1qoYfiXh52Nb2l7V/BkyikSKpROFwiaxXNkykZ8q2tAYhMA+Mo73/+aOmwv5AA3Y6Aiy6ysvlggUVf</encrypted>]]>&Identity;<![CDATA[<encrypted>%DIQAH66V2/v3VIdtwEdruSTkcX630Tv6u0/IFN/ihJp7Lmv9FUprThAo/4w2UDb6RUxOZ8x7dZIJQ8hwiyCrdQ66l0g1DV6rjx8CDatC0t2zqdSCd7OM+kmKrXFRZt2eEfZ8N3nROWBMHxCPysi7DLe67m1aGPRWVTf1mJnSgoGjIcUOyIOEewbxM2SDzgcPUgflwMf7DRnDZvdxpE2hCPBsycS5TLqwCIWPIqYFYYn5Q1hvpaJNzHUyV5avCAK88x0wotd7dODFXgmKhPSeuaaCqjV5tSC5EH3ktOfYUH5tQlrIYe2uUqC6zYew5VIO/IkQs9koYaVOKZvb0ne/m++B7Zst4wT9FXEAnG/GvhE8QveknCXH0bFqOAX3Z7P9JvHUt3UOvL8IsCSvvjeHGw==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxHERUSBglNWtxi4Xx8gTR9cDd3u+8EUJCfhqWYNqyMmsEAfgXtkJzpQ68/575j16O9fIEJLYBa9ZA9o5jxodt6suBWV86h7AScwRu97/1NHH0Uviwdq0esvtptwFsbl8cJkM7/9xaZqlIhMlMyZoO2b5IGBLzVYnAuxSFLJx6gkzFY036uq+UKbaPqB2WvTehfWTEZOCEXX4thx2MtMNLJzFFaC+epwB48geGVNZu1SS8vUBU5AEBk1NLVbtFilGUlGqzV7yH3bbENamfC0PVk3shP2uvU/qYDrefyFXhPxGPFRBznQ9+2PUYy6CeYUUFIMj0qE9K5tOe9eoF7Sld1dSFnWIDDCNBRsUduzuSrHop3WZ6DU+0MW2EtoecKL6qojw7NcBfhEDzWzgdgN1ndBlr+jWpHYsB5tDJ1dxG785Mo/Gv7cx1qv1RFHkiTumt4mnh9WnC7AtcDwAEnzcaU=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>