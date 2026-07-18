<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\SPGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % DetailTaxSPTran SYSTEM "..\Include\XML\DetailTaxSPTran.ent">
  %DetailTaxSPTran;

  <!ENTITY AmountFormulaRate "tien2_tg">
  <!ENTITY AmountFormulaQuantity "tien2">
  <!ENTITY % ValidFormula SYSTEM "..\Include\ValidFormula.ent">
  %ValidFormula;
]>

<grid table="d25$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HD4" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c25$000000" prime="d25$" inquiry="i25$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrtNZry7qPMbwHsBNsjc6Mk1WRLgRhbTBAqb5u7VmEUWTYQCFG+3awI/CHACMPUNGw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQrHAErFytBmVTuYM2/+h6tbHTSuJe4+eNimX9Xcx5swAaVOb3OVZQuway3Ncnl3yjQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    &DetailTaxFields;

    <field name="tk_du" width="80" allowNulls="false" aliasName="a">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQoHHqzLFpN2WlLfP2PtypGCbXrnaXqAqlX+uVrB1nqxwIoY2ncuvfVGrgLIEE0O6LI=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="tk_dt" width="10" external="true" hidden="true" aliasName="case when m.loai_ct = '2' then rtrim(a.tk_du) else rtrim(b.tk_dt) end">
      <header v="" e=""></header>
    </field>
    <field name="tk_gghb" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '1' then rtrim(a.tk_du) else rtrim(b.tk_gghb) end">
      <header v="" e=""></header>
    </field>

    <field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '2' then '1' else c.loai_tk end">
      <header v="" e=""></header>
    </field>
    <field name="kieu_gg" type="Int32" width="0" external="true" hidden="true" aliasName="case when m.loai_ct = '1' then '1' else d.loai_tk end">
      <header v="" e=""></header>
    </field>

    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" clientDefault="Default" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
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
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>

      &DetailTaxViewFC;

      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>

      <field name="tk_dt"/>
      <field name="kieu_dt"/>
      <field name="tk_gghb"/>
      <field name="kieu_gg"/>

      <field name="gia2"/>
      <field name="tien2"/>

      &DetailTaxViewBC;

      <field name="hd_so"/>
      <field name="hd_ln"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tk_vt"/>

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/EahnzGYvvNTqUk1gyEjdGADFdGI7zEy5wKGKeWBrQcLi88o/TfxqdMjnHoGffOkZW7ixgeCsIE1rux8tUa14vFQeGOnhm2xomxYr1u0Gpy3Ohh78yW+kGj5WsPTap1RQ==</Encrypted>]]>&AmountFormula;<![CDATA[<Encrypted>&ANHEiKqthwbsi+Na3F+vkpgaVPUoFEx+EMnecxuCia1/C/GFoQeZS9c6zbpvNmio</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&DetailTaxGridScattering;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756/JB6dPeVkwCfYuq8ju3IgTyvaYmP5SXM3CTuGAFlasExTxCBQbPEXIWZA/Ry229hH4j2n/gnYZn8ybEUcQSpI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5aaWLYgTMRU0ByZcgqjHRC55SKKDzpM6nAJIR6M3DdlNMm8734gbnqrgAI5/KE2EfPUImyLjMjapVxspKpNEqeXkPehR8ICPiPEw+ItbSl0VMgvLnHZfUkw6E3SwQ59lhzSeLpRBw8lMiWX/N3jP3bO94DAV3JmdBlxB4txEN6Kb76T4qH9qD8q0ZslFfdwzlCk86mE5VUtspZCGGbUG9xgCVNVnYoUCJNYMcKTO3LmHI7PzYzEPGBR3Rx8Ip4IsryMiZdry50NXErQF0JelsplIm14tka7VWvgdAvwZyKpZjf1kuNw7A6d7oSwd4kGUmHSfJuD0GmsewTOE9Fp0J9</Encrypted>]]>&DetailTaxFomula;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKuFeHW1vCzjYbbdxHCNbh+/Q1m7Gifp2UWvYusJu5MeuiopH+lXh2WMeAulDwsZZLv1jX60VW4tUMQ+iKNV54AA1LbC8vh4zURWTdU1cA40LTl54hDblPJKE2aSgAWfzjWVGYAdJLk1dIi7WUFTlx8B/mUTC9Lo5bEF0N4875oJfsdQ9L46hP4jjSy45oSLpyATSbh3OjRvJ8V5t8wW1AXXJwAH2jpCl7UPdDMbyIW/iuXle5vuFyQisNoOzodz33VazALY0mQ4zASFDLY6eEGZe8zUOY+fNOB7PhFPLhUyua3+2FfbyLn2/pNG7IUEkaYNX3NRnbri5vWPHqtJ+8uVYtfEE5NygTRa/ZGbtTEtru2siqI4WPaFjt9yTUsGcJu1M/JXR7H0X8UJaJhTKyDnREVf3GM3IkXYPAlEwr9n1xIfR0MOG71bX0RurXI3AgSidNJqxpdQgdduRdzIhR4K+28EIxXr/sx0kjcvauyoZgW+vQWdaBE7KbBzfVqiFnEnQDsQk5kHOqEkGO6Z6pTDR1POnlYGJ7ovU2peSCVegoY8SUqL5xC5RS8j0ESJc/NFBJeP5cofqJSNRX5ydOFr726dPUjvVEzpnAvQVoVHmswpbjoumyrsv22CKZbypelrHLFqS4p76LSsi34k2R1HWHGuPBtMtME+nvxu8/U2+02iuqa9pCBQlaEJEKLKubHg6Y/BzTuxh9j7+qm1Pu0zYLWWkCa/fOAVBWUkxrVSPWvfTvvuAwCMnMXhvwvjgC29xnccMGiY2OUU3Yh1nBryPvbT6Oa7cduX8Igs9ks0GP1KyIMe5aJnV4owx6PTyiLlXklI51Blphfky0C4tECyGkeuqPXSwkW22DbYbUoEb3cdGUsJxwvxGeN5FQZU1iL9gBPmQ4n99ARziF2mQTFJwVGndOb+Dl/gcCM5zAU</Encrypted>]]>&DetailTaxValidSalesPrice;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4a6Qr/64mTKl+bHk93z213QFMbCEhBNISDKWBOnaZbVRoYQtVCXSb0lGS8onNm/XFew0zBwoPZib+RK7cGPOT4lQBkWrWt8i4+3Bg55Pss6BmpUPqujAUoKy3B3mMLy//3VFEdWsxKczDAR/M7vovP/Eq4dc2DiSaenmg//GyJja6qprIyDYn7CLdmefZow+RTLDiHbKp62F4HcWsUzpbFzhWes/4Y/+OpyRj27XLGt7</Encrypted>]]>&DetailTaxValidSalesAmount;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&DetailTaxOnchange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKs8Oufgihk3xbh23lGyltrh3HtxY5FatyTjOiNO1a8OUCs/GZbkCnJa/act9tenTi9jj8Lf+dS3MsqWZgRsttgK2AIcs7Ua78cl6xRfl+lHYwS5cQQgxb79JqGE5D1iMDq39sj1jSN/Yh5FHTvTezqI=</Encrypted>]]>&ScriptCheckGridAction;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4SXRt6K2/x1CNTDoT+g7gO1pVEzorBoI67f1e6ERpZH3lIBBjgWFsbhPWX0DhbWZNl1m5Ya6nTvvxt8y8PVTwNdCcYL21nBdZGoeqDzfE1WZWFBpx0i/2bRv1WQkUvZ8/g==</Encrypted>]]>&DetailTaxGridAfterInsertRow;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKPZ5xWuze8ptVn0CDjmp1HdP0dOWOrmlXrYwfkTEIvI7Cu7U7FLQKHtZusyHDZlxMJKLpW9qlhvQaVHyNE1YhN/03iD4lVlquHwqdnJVuDmXBscEbIFBoDQPs+YDbOm46a5BfN+A24m4I4/h+9/mzKzcSwvNdiYp7Y8GsZBYQKitwoVZZdjPkWdB8MeOMgO2EJMC9hJzddwQkhe9q7Fa19+huY44uUjLtQgorxTf93coozKf1LENgFRua3WrbxteIC+3ul1IBEKg2RVDmIslaXQ0/l3w/q7FSCxx/+edcFJJ026iEdNfrITgpV4og+xQ==</Encrypted>]]>&DetailTaxExecuteCommandCheckAuthority;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4R4WpvLbvChssB89t0nmVq+Vl/DSK9GYA5ZGXr/YMN6Erlh4FxMDj7MuhzfVK08p+RXzJD/Z5IlaEufXn0qHEftok7cC20HDO+mCvPfzd5z7rZTWcHgFfQe994v9l3ZYBlh18WtX80Vhoz3ZJzMK2gSCZWbpJY7SP69gAv6gM4og2W5XEHw+7fjCVrTqOTDNWjNz94fKAiMvWw55/L8VziMuRIxIQ0xev4m6N9Eg/8i73K7GyC+BbVl3G97VIc66+P+ANtLLqFB6irrQWujjRQINUphmK+qfgJsw/QQAa6Fe6tdNlv4SnPJGHqF9uThRfl/vfc3+lUeLSDNI5wvbGmlygpJ/KXhgz0LBQ1pbTsMVY3GovpjCxfEWK1Fv4JyMKHLMLR2A3MNsZH9eECrejQr7N6KdBDACaQH/es1raPs4wW2FnpSejNgFA4LzbS1EmH0pc0L6cjyGe+jTY1G+VLdBqTA9Ycy9KtMZohoTbbdVMOQs3oYTytd1VkhVLXCk9Techw/VbiadlkxF2HGR07teEBtyR8rl0WKf42RelX0RWd6GGsBGkZAaA2cdBVpSYrrecUIxwkyZnen22rVYTJO6VfEoLQEfIRnrWNIDYHyiG86xlZvZryhLxuWK9E2GCe/7+1MC0om6EgNAp2lKpuzBt0r35pZ1QncRbe8/7T8rsY8A5fqr+U34eBfFXkiZpfMI9AnOMav31nP2LLwvsiiFUFLXlHWQB+u3QZ5UKdN7VUqW1lZlELElY+tqUdUckX/AEX3bDnHlTPKuv64V0xNswrx33E1hi71w7ps1KxkThUh+MKYkU3luN5nvdiCp+Fg43LXFLyPb+D8KwO7Rl40=</Encrypted>]]>&DetailTaxResponseCompleteItem;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZmF7n3ikVoG0TXeczNChEh8q4ktvRPnPgb0t/OTsuKrIQpEezK2FnysGazOec5XgMsCRXKZzei66Bp9je4CrV8lgkdoXpQpa+rYuUOQivNGgYEJZ7pWDdHpW4+MiG52HV1vq3JG3sQMXyK2DnGfOYDDhfFVBsiFIGDepixQE3vl0MuTpxoS9u8368t20rqHwnVrUFrU4FqVJcIotGa4G8ABFnb45V92WB6c+AGh21BDczFnF0l+nrwQEtkjtNYf14/zMWZJYsjSWTpgJGzbJrEQeOQln8VFlHbRJHqcGT6l+nKnIhnDMxmJTVkfwq5huHHoU7pWFRM2frvP22LMN1I2Xm+eqBsoMRtb8sgqzvlK</Encrypted>]]>&DetailTaxResponseComplete;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmP95zrGi0d6gM3L6vg8utKjuQIg+K/RJo6yIvqktOQZVnZkj3I66HMg8VWD9+VhfvjUO8og5+AGxfIDB0fE4/Ug==</Encrypted>]]>&DetailTaxValidRowChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XhBfzIXfAYf3sbhatzJUfU55a8DwqlmSdC5Gb9G8YosYSAWNCcv/352Nxrp1WIAdE0PyFbqw2hafjQ6g/XfrzC07HUOl64Za4jYd2DwsPjUQqgRlArbfP6m1l1g5pKoeKaNFc4Pww6JE3LGWoKgPebN4TyoyQCc8tWZZbO+uZuL</Encrypted>]]>&DetailTaxValidTaxChange;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5J3qCcx/5Baypb0eGDoPkZwlbHmpCt2WIcVIpZIHXn1j6FtDj4qz29USnENsDoe59t7A3L/4Gli5poedw40D6oGz1MTV3+9jkv8n9MSIxkfPI+JxiYu2xsyQRBmVgUQZok</Encrypted>]]>&DetailTaxFlag;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QOCVF+ekU03F7aV1Fw8qBeejwo4WNSb81oo9AS172aY</Encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2DgovH2I5r7Zp60T52mgYbNic5yDVZLkkyVyPQMKysaxt1kOwPPO2+90aaemZ2UdLBxEAe6JeZpgyArqdqyNpay9eK1jQRaKvGUmqC1CO5cLk1tzjI10xZsjnkvcez8b3</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLRqw5tl+Vr/ZzUCrs5op1e5g3wJw1x6BZ7s16MkJ7684oSnwgJ/gElVGb/q/FHcvQSayiA9zU/k6Fmzkezn8UTW+aBExJ9n2584pyBKjb8G0dt99rLOWPwcUazJzvj+bHA==</Encrypted>]]>
      </text>
    </action>

    <action id="RefAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcP2pHAEsSt5QMqLRgwu+fi2HzO/SlMDNY8eanugLDxjpPxtYKa+WJDxNX/s5NxYBDASYxmtDjt+uU4VbeUPyCCsZnYrvcZoTfq1hL0O36y65</Encrypted>]]>
      </text>
    </action>

    &DetailTaxGetTaxRate;
    &DetailTaxGetTaxAccount;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1e4g0R/mS3tWwDwTZBPF4eVC2rdY4K6IJqO512R+X2vwQPW3EBxOvQC0Q1lE/O5i+vDZigFikyJAnHb9kCH8h7Bfyz82Nz88PUKPhWUXkOzNKJ6pmZLm8Bc9nbPZa3cGVUf8M/deX4ed/hLmYwYg6tw==</Encrypted>]]>&GridDetailQueryLoadingJoin;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zl2hexI/4A5S8Wjp4RoZkKhwN1g+tuOHdqzwOHmwzexQOP81YABoI29LAy3jwzdVDe8ivfCGQoRFiee7VHDLA0=</Encrypted>]]>
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

    <button command="Retrieve">
      <title v="Lấy số liệu từ hóa đơn$$90" e="Extract Data from Invoice$$120"></title>
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