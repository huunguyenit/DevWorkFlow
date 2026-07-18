<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY Controller "S1RawMaterialDetail">
  <!ENTITY Code "SF1">
]>

<grid table="es1$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF1" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs1$000000" prime="es1$" inquiry="is1$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Nguyên, phụ liệu" e="Raw Material"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1" information="ma_vt$dmvt.ten_vt%l"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILiU4/j+cmvwbX7aFrs5SgWqaftFWGsSjgpxOktg3dwf/</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên nguyên, phụ liệu" e="Raw Material Description"></header>
    </field>

    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQowYlg7VPXIMNBmD+jseiZqj9uZprEUTlNGlIjk+qTjkA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtRpUyjZvArDq5qaE9eL1UxUEp0MrMMXXbY6inLuRYm3e</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" inactivate="true" clientDefault="0" width="80" readOnly="true" aliasName="a">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_px" width="100" allowContain="true" aliasName="a">
      <header v="Phân xưởng nguồn" e="Source Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_lsx%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l" row="1"/>
      <handle key="[ma_cd_t]"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" width="100" allowContain="true" aliasName="a">
      <header v="Yêu cầu sản xuất nguồn" e="Source WO"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status in ('2', '3', '4', '5')" check="status in ('2', '3', '4', '5')" information="ma_lsx$vcs2.ten_lsx%l" row="1"/>
      <handle key="[ma_cd_t]"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" width="100" allowContain="true" aliasName="a">
      <header v="Công đoạn nguồn" e="Source Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c$%r.[ma_lsx]}'" check="ma_lsx = '{$%c$%r.[ma_lsx]}'" information="ma_cd$vsfctwo.ten_cd%l" row="1"/>
      <handle key="[ma_cd_t]"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="sl_tn" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" aliasName="a">
      <header v="Sl tiếp nhận" e="Receipt Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_cl" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" aliasName="a">
      <header v="Sl còn lại" e="Remaining Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_sd" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" aliasName="a">
      <header v="Sl sử dụng" e="Processing Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="rework" type="Boolean" width="60" allowContain="true" aliasName="case when a.rework = '1' then 1 else 0 end">
      <header v="Làm lại" e="Rework"></header>
      <items style="CheckBox"/>
    </field>

    <field name="tl_kt" type="Decimal" dataFormatString="##0.00" width="0" readOnly="true" hidden="true" clientDefault="100">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_tc1" readOnly="true" hidden="true" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc2" readOnly="true" hidden="true" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc3" readOnly="true" hidden="true" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>

    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd_t" type="Boolean" width="0" allowContain="true" external="true" clientDefault="1" hidden="true" aliasName="case when rtrim(a.stt_rec_cd) = '' then 1 else 0 end">
      <header v="" e=""></header>
      <handle key="[ma_cd_t = 1]" field="ma_cd"/>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_cd" readOnly="true" hidden="true" allowContain="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0cd" readOnly="true" hidden="true" allowContain="true" aliasName="a">
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
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="ma_px"/>
      <field name="ten_px%l"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="ma_cd"/>
      <field name="ten_cd%l"/>
      <field name="sl_tn"/>
      <field name="sl_cl"/>
      <field name="sl_sd"/>
      <field name="rework"/>
      <field name="tl_kt"/>

      <field name="ma_tc1"/>
      <field name="ma_tc2"/>
      <field name="ma_tc3"/>

      <field name="lo_yn"/>
      <field name="ma_cd_t"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_cd"/>
      <field name="stt_rec0cd"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iQiDma95rJEgDZwaYjvIOYF3BBM94WTKsOjq0OTmvMpi7BDl8Kxr8EZol/PjFltDRWKj2RZhNXga+MvI/QAg1N+wUk2VFWUuOM/3ujhCMoNDrBpnXq28AC5p5M1UauacUdgdSkcK8HfWxIvXRF03P6wq3W4K4MIwspFx4yHsYVJGodmoiXAvVBYcawByYjFFD/QVvQkcLgji8h7Qt5VdAqmj/BmvEonYk3oma6LNfKPcRx3FHklak6QXihx9Am/q3Ejq8lBl5iTXVoGC4OtsCskXLG03bwD/MonxlSBDRskXtQkqDF452ie+jg8h9ayLkefdJTye8OiCGT6svJOLTImhBuv7Rn7uQqJz75DDGGwr1IucaryUSWz5DfLFeCZjIrzFE3mEeqSHDaLj0oID5AA==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8q+aAfaKX9gCfQOs4ezbHCT6QVLfAYlqPn6pUCfPrioQa0QgtCc+3sM/s6qawdTAA==</Encrypted>]]>&Code;<![CDATA[<Encrypted>&kF5JEuwtJfmtB14kre5wRS+MNfbADsH6mKCzZP68N7usVaXzuVYWj3EIoEAq5fz6Cs7ExDEaNnLGTpuI3s0YUjMGEX4CGgAFuzfEpv6dBo+0GQrqs33fgTaeBK0AQ/vzJ1WNaWPwPfQFw0/CvM3ojqGlrh8j0TQF1J+eMF3ckfI=</Encrypted>]]>&Code;<![CDATA[<Encrypted>&U5M9a2ZkLHTRJtDrNNZOF/k4EnPX01wJNRwj7TzkAnBYAoKbiCEp2lnhjJGiusloT3MIcPl9kyk+PnJMt3fgis/LEAOPQHaCeKfgc7WUsjYnXbCNg/EaOL6mfPDl7KSzfPRZOfrAZDXdnXS4fYN7TeheJvFWwl94V4x+eK+dvTc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVhW9Ye2P9vN6XVGbzXjdRMpgtQkSCcygI0pfMbNNFx9g==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5HvzbxBgumpis5MOcCHCpbCHUxyVuwPcSDjoCj4XoB1A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1/Mogy0FPm8uUth20lwZPWYBwzPJ9Ex4kNqg9BAJEtfisAfN1RZE7Ea/ze2BG2W0CUupMWWsTymWOkEc7MAIKQw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RuC2hHhpjJ2+WhmLZlVVaPW7vhWRknwsiyvnfI61dIIIzevLv128PGkRC92kr6N6RzjMjok4QrH00d25f9xwFNg=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS970XdZtmsUi61yoyHV3Lv1T+htwBXp1htSCDlkMJVweM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdvOh0nOUVe7BeBuS2lMmmwEKSCEPQ7YzcTvKVXjgpVNBvU9tyxxGfP4cL2pZz5dbLoGhzcJCVqh/y3Y65SLrl5mbAteufpxZgB/l310NHd8wnqR7GXZ8D3NNVLn3JE3uS341Jqz38zW14c7hgvvPADsrivzDRO7R1bwWl/h7DKYQlIY8tgOABqzu5oVcPRu1SD0cADhTFYuHacF0gTRAnfiO3TwZ2dY5pKdWYn4uutoUQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+3cjzkMHK2RjfNJH5Zu70dl1WjkXDX9JwP53S3UEmP+95ICJRFgjzuB+h1lxS8osPBQ6bx+9IBgBK4yxtS1N0hvdkfUQgZWTZ2xFdpdpn6Y</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATaXi+hfMFn8i8+B2+OaNDpJmNVKS/UFmTWgCCDO20xz7w==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvcJbZJZuPqPO838rut1VWC6dJIjjzmVr65eU9VHir6/MbYhYOO6nXgZa+/NC8ZDh0LirCAioDCALNt0qWplGQuQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RpFum38JGD6+/2ip4K4YeIsczcrBjzVFVDjcIlS+YjbW//aydQhKRPn5NGs/fVJeTHbsb9gKQYH/ILjL08Ee29g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILlMmXnpFUjBRC1KrBOCe9zYv4VaUena06Bbtn1OOpw+YACnk6mLfsCcPbxDvVD221bQYsqFauDVXyhTrq15VBU1ct1s5pTQxiYC4qiIiXbUelTM7YVsfU/Pm0XvEIur9mA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtccrK29Q9xO6AAlFSeYI/LPTtzYbCm3i19UrlzxexhHtgHrS3jJSqgbN1KFWv3b3a6FYQNXFwfKh1ToqT1C+ELZAuQQYIXtC971AZOygYUn1MfWiQ6eE7PsTTu29peAntA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12EsMpyvYJtfA70TGj7FSEzdyIZ2XynZHLoqclMaURxJ1e1UzNOHeirZDNb+JBzZwEoFOTVecckgWaqwk0pVdoCYodIVzJhWLEiAfrRxgJXLgUH01lPZqtX/DcWYAOxjxHoDpSyciclLEqg8BYwNqpG7gxR19UZ9GXKd1onc4VpXgS2xrh87e85j7/oF8t72Laf429xzBGkfnK+tqlsLRaLM8fEaPfdblbiNK9H9B1wTqkr+PYL25GD16Ci4F8i4mvj7YKgoi63wq38y3bK+MQw8oV5DDJ/mFmIJpjJOZTbdGGPgHQAuHJ3qCl+hMXRRdQj/9WICFdfNKtQRDd27rCk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kzM1MFg7rupLYJM0kTa3w5Y9bEm+XOn8M8Um7zBDc/wO8SrIRelZpTPrZh5aQYmqM+YVAS9aK7tT++XM/Vd0JvjBWCk8xsMd+ov6qeF0H3wWArHVE7Eh4N/kN9EDjhFTm/NOtVl3YphxRy/PPBkHl62CV6UvPAKBhDOHg6g1Y5mUYxRAaRfH0ZZLGNq73oda1GhYkRwTxPWBCRjHdDpD/UrafIsPtfx+lts0/PoWrzjNJQvvmIUmbVnq1NQ4wXf8VeqKgqF+UHoyruv8fCzbVRmCQGMTNfLjrcV5Q+8BhtViOrPbyNSxN4N+G9LdCNiMgXjATR0neeaxB29CUBnDZyYYaqyaBRaRUheyXfW2wX1FBKtNLtJtd6DpUlW25yTy+I+vgh5OWhA+TsVU18Zt2yjgVpienBQ/CZ4iy/XElVzCn8pvs5w4byKvRYrjiDIKM21r2KcfsKrL/IDkb/OQ4o90Pj6iVq9F18Nrl5XaY4ZcRFauIXs1qzj18SZ1quuwsqCEhGp50fAveL9CJvsTWSYl1T50bT0+IJ4Kf4PoW5EmtGq8XFcBLOoY8s+NAQyzy+7IO/ChXAW17nSFziaqBI/0PWbXVC8vKpakx89jiOWp59+4zozYoKe4dRfxhWL23SQivCYTWGOKGWw0WA1nsv++61aewPlkGWtNbgTzGtpliA6OljuJ8MEFtsccGWSbmqgg3nVL/y/VgdrrUxk5pqpBmNRc2XHEthJ2uKy+krTkUIVBw61oJ+ZS8D95hA896A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLUALvksl3OTwW4uS/MvASGCpVGFcSOqD5S3C8v1UGCRcdTT1FrZQoJEB3nEz49rd18Pkmol8MqKkCxFdd3FVz8PPgQZJg2K5N13IkWXmOo6Duc7QLDxxL90ybq+hkSAK3eUka/LsdEjgME1/1RQUhD+sA+91GTtuEnnZtHdlqVb1Jvdg0+IVTlTPXvrVwov84eTrtRc/o6wkZ3UqT+EoBrahmEi3rIuY0lEn1a7m/mXRRoh91IsPOeGV/OIhhF0FFA7iWyyOVkSZLW1yf6e5eduCR5WriZHOaPFA3g3kHW8b</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&SBybkNWdArVdsbXXItSILn2gtmBrPIqXhzijf/WMMoWuSSofI+/f/Bcgf0Sti6g2BTf5nlqaYQw0MSt2xg7L0ARDtbNxCrdTp3Ju2IOI1kgbu/bS3L2ZoPb887vp/+rIiGHvdopiDFEiuLEIEY/GASpXdp9SNJsSg+JZ6JczUzKwSGbhLFifTeZzmHymjXcJbF9punW7S2fs22LWy15mic0IHclh2LcTGKVt9sSFYza9zgFa921Nj8gpZaISUvgC1qH00jXCgoVAjiYBeoBsVw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxa8z+ew0w+YauvOLpOT0XxxidXTSncBXhtzH/ByLUcRxi4plY2782iPiSFibdgTm6dyszPdbL0gT2+eEdnZBEfc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&g9+OJ7sPPn5FQW42RgjNxdATiOjkJUhTtUBTsd4eXpToDj3Mpd/OGFP1t7Un5mGesu19jzme7ftY6uOKiqXp40PsH+hJxHSGsfVUba6uMJr5bSrePgyGZRghH3KeYcfYO1LQGH1k0apjSXdIgvz/nCOJZH5mrkovNCODtiZjNpXb+U39NhAhYMcvRWvo6vI7mz6PknXrNLO3OeLY/+fAwa2OwWtGZAX5e9yCprQ471iFfVj+tDWPdL+XiGaksSgGoSLQ1FR8Onnez3vngrL7mA==</Encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXE/5+tGPFDslzDTWxkGESDrpCqzTem+GfltTL/s/TesfyY+aJ9YB1ukt4kXF//lXNQQs8k14sAv3Xeg+7ohd0KXVbbVU7hlY7nPsiF+EJT5Js58cXU0HfEEeEOxrgmkI+c0GTi3u3GcJUuYkTBz1odFHHyCWlI6E76AWpB3Qquhoiplt+9UiAdvJJHo6BtpQzw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
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

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="Lấy số liệu từ công đoạn trước"  e="Extract Data from Previous Operation"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ định mức nguyên vật liệu"  e="Extract Data from Bill of Materials"/>
        </menuItem>
      </menuItems>
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