<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identity "LimitReportFormRightReportDetail">
]>

<grid table="sysreportidright2" code="user_id, controller, report_id" order="report_id" type="Detail" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="user_id" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="controller" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="report_id" isPrimaryKey="true" width="100" allowNulls="false" aliasName="a">
      <header v="Mẫu báo cáo" e="Form"></header>
    </field>
    <field name="header%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mẫu báo cáo" e="Description"></header>
    </field>
    <field name="r_limit" type="Boolean" width="60">
      <header v="&lt;div id='ReportGridTagId' onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:-1px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Giới hạn&lt;/div&gt;" e="&lt;div id='ReportGridTagId' onclick=&quot;toggle$&Identity;$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Deny&lt;/div&gt;"></header>
      <footer v="Giới hạn" e="Deny"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="user_id"/>
      <field name="controller"/>
      <field name="report_id"/>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERrMbNjq1RolZjxc5q8yOXaQZnYvZGj9WjkIaSzM1/z8nx5qUoDqlHcL0Jzwa/1/+z02caDo4uOp4Sqii+5zwXEAR74eGYyi0wZxRaMEdGhDh</encrypted>]]>&Identity;<![CDATA[<encrypted>%DIQAH66V2/v3VIdtwEdruSTkcX630Tv6u0/IFN/ihJp7Lmv9FUprThAo/4w2UDb6RUxOZ8x7dZIJQ8hwiyCrdQ66l0g1DV6rjx8CDatC0t2zqdSCd7OM+kmKrXFRZt2eEfZ8N3nROWBMHxCPysi7DLe67m1aGPRWVTf1mJnSgoGjIcUOyIOEewbxM2SDzgcPUgflwMf7DRnDZvdxpE2hCPBsycS5TLqwCIWPIqYFYYn5Q1hvpaJNzHUyV5avCAK88x0wotd7dODFXgmKhPSeubQgVCuLyQfAGcR6e9E1RSyFRaeTCaaFUl0Idu7dNhkdPbZVeQwLuLWk4efIRBAlGAoskbI/lU1joaAELwxk4RqX89gPLxe0A9ZjQtYMrotoy+EZA57xatgDKV8+g7baMA==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxHERUSBglNWtxi4Xx8gTR9cDd3u+8EUJCfhqWYNqyMmsEAfgXtkJzpQ68/575j16BrfMtdyipOO+cSYooqAP9GOWFskOppwQ+REPq2ZgYrsCxWnnzM+h1jSROUUp3ZvSWM1dGt2xIZUhhWChM5e9kyoNaid0kKoYlgEsrz/YAxh2f05wzvyTx4en8tUX4uGiQ5imb4h0qMdwGJ7Q9u1zYy1cd4XtQ5SnapElGvWeYyYL4gPL5QzX7Q3GUim8EVB3L2qUgr8cAp1WCKDmiJ1LtiA24mLbVx6Aq8djPqIZdASoU3l1YFIHzQR7NlBWcTYOWuN8K/ZG6fv8k2ytVrgypUsUrzh67CAMiouPWdlNcpeYUnMv193MXDeVIyCUEI2z3i7DOMJgIMBga8TO0u5xHFzF2rFbSfIpH5gcMmipYkB2k2SxAdhDWc91G75dybx4RZiWgVvAJBuMIIFHO0r42o=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>