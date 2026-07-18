<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
]>

<grid table="ctns2" code="ma_ns, ma_pt, ngay_hl_tu" order="ma_pt, ngay_hl_tu" type="Detail" freezeColumns="3" id="" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""/>
  <subTitle v="" e=""/>

  <fields>
    <field name="ma_ns" isPrimaryKey="true" allowNulls="false" readOnly="true" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_pt" isPrimaryKey="true" allowNulls="false" width="100" dataFormatString="@upperCaseFormat">
      <header v="Mã người phụ thuộc" e="Dependant ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_pt" allowNulls="false" width="300">
      <header v="Tên người phụ thuộc" e="Dependant Name"></header>
    </field>
    <field name="ten_pt2" width="300">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" width="100" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="cmnd" width="100">
      <header v="Số chứng minh nhân dân" e="Identity Number"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVO3FsiSrRTDzB7+Fvgyoh/LQ2vTW278TocjtEIoyT9T769Wjmi6zzi+L8vbuy4ZpA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_so_thue" width="100">
      <header v="Mã số thuế" e="Tax Code"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVO3FsiSrRTDzB7+Fvgyoh/LQ2vTW278TocjtEIoyT9T769Wjmi6zzi+L8vbuy4ZpA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_qt" width="80" aliasName="a">
      <header v="Mã quốc tịch" e="Nationality Code"></header>
      <items style="AutoComplete" controller="Nationality" reference="ten_qt%l" key="status = '1'" check="status = '1'" information="ma_qt$dmqt.ten_qt%l"/>
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

    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" width="100">
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
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ns"/>
      <field name="ma_pt"/>
      <field name="ten_pt"/>
      <field name="ten_pt2"/>
      <field name="ngay_sinh"/>
      <field name="cmnd"/>
      <field name="ma_so_thue"/>
      <field name="ma_qt"/>
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
    </view>
  </views>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmpDDD5aSOFvXVVYEBexQkhWluE+tGzdc34Aef0Fjtp8FgyzRqa5gXSl4Wgp0RJd6wqBFe0i4Jd1/ov1uelfF0UPVwHn0UTN0gWozPO0JlfgIeyKLcMtidEZ3ZtoQBA1nIY=</encrypted>]]>
      </text>
    </query>
  </queries>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiHDVDng9BqAiFj3NphfSkTBsjnqY6F4lKUEER7u9MIFzTcIyyKnAr/LHki5sXXu0n/vwdV07NeIwVK9wIvOUObM=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiJ3kRqL6CGB7MB/Ks+hqv83Q10AVjIvemxd8cSgU4k72qfaQOg0R0Y7XeMYlDfO/2fqEjtH0spG/PidSqdbJ1Pk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hkk3UV+3tSPBQanO47BhwpnLFi0pxlZr9uPCcu/kxLV9pqqDJBxwL/ez9BCHd46eh7BJ1eVObUqatWMmr7zBHnmrfpdC/hBIr5RFi/JCLvh/r5gUIiqFfr+0G79VhXJQvb70HEuTKkF+8exMbPq73SlRjugR5gNYhEU/yAmNi3t+phUMe/2f8FO5CHRM3d5Z9Lvp/rgDecGQ5OX0D1FrmG9vuN4DXWYi9ZghSsHGi3YB9I0miPwFPQdnoWr/N5KRphkfZAtjmmFAImcXOKEOVcCXBbcfBnv+5CwVWEEi/ca/VNwZDsak0i/hFJcZQTUyLaB9bEVP5dkUOSmCsv2lkoOg4aldaRGdtPH7CKGMnbQN0/M17N8USJ3m1Y46Ib2vCn3tq/zoXR2+D0tTYx1QjHWmkUSfySmMC3pB6X2w9iscWqUvlUvHaNVgsG3t1zZm+JOrzcoA4PovEXi6Chik3B2spJmA7+217Oto2qMcbXkoJ1q7ipIErrARqwJekPhDuJMj2a3GIwxqoWa8yxtrFPvFKQnxEnHqz/eqe2t8OI1ow==</encrypted>]]>

    </text>
  </script>
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