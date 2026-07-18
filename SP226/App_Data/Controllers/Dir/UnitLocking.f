<?xml version="1.0" encoding="utf-8"?>

<dir table="dmdvcsks" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khóa số liệu theo đơn vị" e="Unit Locking"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Khóa số liệu đến ngày" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliaaZ7lP5GMsQAn9UOKTX6jNSmz2Lsx21XGBzffwjp73qpdES1X0dGdDa3XumMpod28twivihM7TfQVHSKT9ZNB4Nyt2ekgZWWYmK8V6m9jDXqYsWcKhtr52W6JOj/Yv9bwo0Xu9AdbFlm/PzYaePU40Pt4ON4M1m24iuTuOTbCPHI/zJoDGcKHz5Sd8EQsJ+9rqJc2hWObE85gdf8mEUwaC9xeuBVCfSRiehAy2Q3wmBvM1Ee3RcwlVg3q3pMcd1krOcvr065e9qk37TLHKsLUgYdiSiv5zozBWbs/CJjpYsL9J01QYTKBnLYXXJyUfF7bOd8jYX3wEirkmf1/Ffcsfbg2hMHdJqy5lTmtHDCLGc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cVE/lvD6bI1AWgmax03/0ir141tE5ARhfgnUqk3hSMKXtK4PQOqx4ygS4+5LzKf/hEGlu5O6JRSBRlOC4aNk8eAg81jldswh/0vWhPweTHFZ97NNR+ntmytaAgamepVwY+JkLVnfY2WYHJ+i7sqPhR9HwDkjcgItN873XLd7GlWmnvK0CiuJ8gS2XAZq71ODV</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AFo8kOOjivnSxD6MVNNAuEgAZ4LD9G4aWIv2DQpZobG2NVshlgi+BvZh069Qs28xlDNy6QhQCeC6jnjOIH1mR98MX1U/PGyKxBWqKsv5GCFeQF2Rt60ytsIDU6DPX9heDUfLRDQFMt1v9sMZPZNzJHOtrOsS89E5VdKkBHg3tyD4W6J9zuKOlQZRSyEsGfjKNPXsNClT0BPdzQDMF4Qx1m1CT2cVsXNJcTjlvCJtiAi0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuQkjfwNNbUg9TmXvW/awhgSSH4yt4a4mTJ7prLX2Lm2</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>