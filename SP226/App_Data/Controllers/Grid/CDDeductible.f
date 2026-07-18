<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\CDGrid.ent">
  %UserDefinedFields;
]>

<grid table="k51$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PC1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c51$000000" prime="k51$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk" width="100" allowNulls="false" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrna+ljy6UgLFkPWgko7Ple3pE31/cXLdAb4b5+hSPRhKMEPsNRKQ8NY6CBPCNlcCs=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="b">
      <header v="Tk cong no" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c.ten_kh%l">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh nợ" e="Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh có" e="Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_dk" defaultValue="'1'" width="80" clientDefault="Default">
      <header v="Nhóm định khoản" e="Group"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
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
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="tk_cn"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="dien_giai"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      &XMLUserDefinedViews;
      <field name="nh_dk"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL759k3mPgsFXigQlV9TN91cAeC60Nyoj5v9COhesRzlL+tHacq9kLrgixiSwcCw3S9Ev1OcSCHWRXuLuFkAjPvrys=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75xRt/cKFLam7y/utk9CrMOQuOmJMzOioPhEGVhY9+l/yylleRbHK5jLM3noF7Mkb7T44pIoi6WX5KqQSMlc7d2c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5bRQJuAJ7273AAmhHVDCBGV3NE+U70lnE6NzWUYvEkDWX0BCpoNamxLXD8xEEaK0k8mmg6KZ6ejAhoOghSEAKT+FHjQ7LAWoRAiNPsvRBk3LdrMq1xI1DNgCMa3Yg97thYnDGBCFn6FzFAQ+zCBKYHjuiItISEGE5t4SA/LhzOylySCcTmWbmERwElENrwe5UWU6W4cVWzCKX9Se1UPBkFWxUsapP6UBhHCxBRylOne/VGjiw/0T9Gx0whC7h8BAUoF+lchZWHveL0a48wLeHSzyUpnSvWFgRvAh9bDrDb16mR86IH7S1C+yuI7iLpDkV5VOHwS6mAMLVz1WT4QwfgJdTVnZ6SWgrtSCJzBeOzd9OgNeu0wBeG0WWbVn6lnIvuFycyyMkidrK+1axsNT3VxeSyNqcNQv3UpZoLJcqYaEm+gAiZFtR8pKUf5496dsqi84NbrNPFV5Kj06AdvGLS/q9uDlaFBe54hbOK3DtBko5XWjnV56UTl2PzNsSGPzdn4k43NLjhTLtrA2BiRfIEybRDQkt4z+91Cv3qguZEVb7A/0+bB/VMx98wfYlB4ikSSvsDnSZf9BoMA56TRC3xWkoDSrU2t8VfYhKIDlMttb6o85htU5h2EKvwktSDok/mOwle5cgtArCS8R8GJ58nAlT2IyyfdrTO7Un4S9dYdPsyy08OFdxb/YQI1B4T7FHQiRvGUNcMm/xY0+3OE1DR8DpCCjlY3WB07o+N1GTjrFSLpvlLNKGzEXgsHBLMrP8TvM8l3r5UwtHM23pneIiDwR8afRBoBBi5HofFICjRWLaF4K6Yihq17pb6qEEjwWe5fD4t7vBFLa7JHyL15RMk7QmLnLgeM0JDQpVLjXDYjiAr1NIL2LjIxuYq7gznLEo4meIzTXY4OUnxLnDbOBaJVETR79pO8IzOXfTJeNtYVZiIctNXnrhCzWKBeD4sElQ9Y7D31g/cphoTETa8h8coKUSyXAqQgadXBn1CplafdNcgJCw/iHxZcVIQysQjt6nJ4NkF5ecsio/xt/lc8mH10IsRd15u3/EydlKzA/igISt//uZz6D0IqBwtFDu9rWw4kkfVETnrQAW9CiWxutpGevSlwQduG6GO9DnFVbjxRlEvvjHfxFq4iagoY2K+3qzLGRop9GqDUEGH9pANd+2kZg4I0ehizANHhjQZaSLWcPIQLmAV4KMZDbEiaCIwqzEyW3YhWFj0fmbYvo6RTAFi</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35Jc8oQ9NuZIOhCca0zCH4rH7iGQBd+ZHE69YeWoBKeATk9UTCGZLXxUKrtkm1ElP8uFBizULGz477EAJraYSLDWnw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/i78tusYOHM8A+jYm/tXbRoLAa6j571Iw4ej4h24bdq5Tixtd69sMhpkP5OCCEkZHoUzcG+Aqgz4opu/u7V/JJyGr/NoT/mRsu6dyt+4KZV/mjmns8ZLVRlnFNowaFrOMDWbzl9wD1tJx9/3BoYDta</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>