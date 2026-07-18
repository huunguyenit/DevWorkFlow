<?xml version="1.0" encoding="utf-8"?>

<grid table="hrttctpt" code="stt_rec, stt_rec0" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>
  <partition table="hrttctpt" prime="hrttctpt" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_pt" allowNulls="false" width="100" dataFormatString="@upperCaseFormat">
      <header v="Mã người phụ thuộc" e="Dependant ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_pt" allowNulls="false" width="300">
      <header v="Tên người phụ thuộc" e="Dependant Name"></header>
    </field>
    <field name="ten_pt2" width="0" hidden="true">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" width="100" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="cmnd" width="100">
      <header v="Số chứng minh nhân dân" e="Identity Number"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZejwuG3FXgKty2XZyo2w8rH8GESejRRhmLTQjXOGcspmFShbUA/QrhqmcJlJX31ZIdG24RAcvwJheIDmoqdWeRIq4Aep1jyZBCvIxcpXd4Rk</encrypted>]]></clientScript>
    </field>
    <field name="ma_so_thue" width="100">
      <header v="Mã số thuế" e="Tax Code"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZejwuG3FXgKty2XZyo2w8rH8GESejRRhmLTQjXOGcspmFShbUA/QrhqmcJlJX31ZIdG24RAcvwJheIDmoqdWeRIq4Aep1jyZBCvIxcpXd4Rk</encrypted>]]></clientScript>
    </field>
    <field name="quoc_tich" width="80" aliasName="a">
      <header v="Quốc tịch" e="Nationality"></header>
      <items style="AutoComplete" controller="hrNationality" reference="ten_qt%l" key="status ='1'" check="1=1" information="ma_qt$dmqt.ten_qt%l" new="Nationality"/>
    </field>
    <field name="ten_qt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên quốc tịch" e="Nationality Name"></header>
    </field>
    <field name="quan_he" width="100">
      <header v="Quan hệ" e="Relationship"></header>
    </field>

    <field name="so_khai_sinh" width="100" onDemand="true">
      <header v="Số giấy khai sinh" e="Birth Certificate No."></header>
      <handle key="[typechange]"/>
    </field>
    <field name="quyen_so" width="100" onDemand="true">
      <header v="Quyển số" e="Book No."></header>
      <handle key="[typechange]"/>
    </field>
    <field name="quoc_gia" width="200" onDemand="true">
      <header v="Quốc gia" e="Nation"></header>
      <handle key="[typechange]"/>
    </field>
    <field name="tinh_thanh" width="200" onDemand="true">
      <header v="Tỉnh/Thành" e="Province/City"></header>
      <handle key="[typechange]"/>
    </field>
    <field name="quan_huyen" width="200" onDemand="true">
      <header v="Quận/Huyện" e="District"></header>
      <handle key="[typechange]"/>
    </field>
    <field name="phuong_xa" width="200" onDemand="true">
      <header v="Phường/Xã" e="Ward/Commune"></header>
      <handle key="[typechange]"/>
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="kem_theo" width="300">
      <header v="Chứng từ đi kèm" e="Enclosed Documents"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="so_lan" type="Decimal" dataFormatString="##0" clientDefault="0" width="100">
      <header v="Lần bổ sung" e="Adding Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="typechange" type="Boolean" width="0" external="true" hidden="true" defaultValue="case when ma_so_thue &lt;&gt; '' or cmnd &lt;&gt; '' then 0 else 1 end" clientDefault="1">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_pt"/>
      <field name="ten_pt"/>
      <field name="ten_pt2"/>
      <field name="ngay_sinh"/>
      <field name="cmnd"/>
      <field name="ma_so_thue"/>
      <field name="quoc_tich"/>
      <field name="ten_qt%l"/>
      <field name="quan_he"/>
      <field name="so_khai_sinh"/>
      <field name="quyen_so"/>
      <field name="quoc_gia"/>
      <field name="tinh_thanh"/>
      <field name="quan_huyen"/>
      <field name="phuong_xa"/>
      <field name="ngay_hl_tu"/>
      <field name="ngay_hl_den"/>
      <field name="kem_theo"/>
      <field name="dien_giai"/>
      <field name="so_lan"/>
      <field name="typechange"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiFbSLedvRMIQQcnX4rL6/kOdufhAHOdSCixHh9KpkZEL528/W5rvI+X6S2/MyAhgtOcovA5yeqw+/TwWgXnClwektZSgapj2unorg4c+tpB3</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiLR+5gfkVjwUaED6mdZx2rcqGvP1qopFYpeXlCUQooELSx5rncJ9egbye3+sO4/zlu12WugeceiS+vtZOFdYNBUHB7OYgfERMMyROCDr+o80</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hm2lwZBeNFkIvD3ORVV5uuVc+3a0g//DIcDcdabj9aLCc6+pGKC5ppXzDrCedglb4OzKzYM3jAJovPqkNFtuEA2OkGkl9xALpHoizOribxTOZlgcd3PlFc0SDRjtaBuM9vHyr7FEifglRJ3uzD1ggCWZ1zowiRK3kWXgbWjlyjxzZ55kyUAk5ZK+b5IxSb85a8jFlDocTVK5bJT7itZ3ctpwlxxmQBjRiWgVVB1zaEN/2RG/tyEHKM93ylgdN0mWVOxSV3NYmYNhMjsS4Z2Fu1/2jsfuxOm7ETF/rD2R4wMi8/4I+QGCQVXI/rd4Fs3bj9OhudYvl5YhyIBzCshYvMs1CeYU+dXG1hKzU5YSWSUd8SFMKdmj2BYaO1BnIFM9GsDfJTff79fW6ct54pE1exoQs7bIFJG/+lDKlhHiWMwswtxxo8je6JadXXlrjFEMwS9K9t9VHxMEl7jNko1bcF81UKfE+N33wRQnTeOaLY8JEiUGemkbd/R2bTFMQp4Ft1KiRvMn81RuGdLzGqYsvLXpPPH+Fr3XLYuo6cYGtpgEEyiroPaahOKWt+l96fdk2A1lJOaSbQRBMHzvhcnaSStuioSSqFiNGfHHcHNyEcj2A==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmoS0KXcExNhLM+s3fk22C0aSyulSQvC61p3sHLrXRKUvdBJPt1MRyWJr5iasfaxWsjGnWEm8BWi7AZhGBtusX0ngHt0mp+MpraW/26AChCUalGZa2dc556CEfmItAlOfvw=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>