<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "V20GLTCDT">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @tk = '' then @cach_tinh else '' end">
  <!ENTITY Check "
if (@cach_tinh &lt;&gt; '') begin
  create table #t(b bit)
  insert into #t(b) exec FastBusiness$Report$CheckReportForm @@action, @@table, @form, @ma_so, @cach_tinh
  if exists(select 1 from #t where b = 0) begin
    select 'cach_tinh' as field, replace(@$updateConflict, char(37) + 's', rtrim(@cach_tinh)) as message
    drop table #t
	  return
  end
  drop table #t
end
">
  <!ENTITY UpdateNormCompare "
if @ct_tong = 1 update @@table set ct_tong = 0 where form = @form and ts_nv = @ts_nv
">
]>

<dir table="v20gltcdt" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu bảng cân đối kế toán" e="Balance Sheet Item"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>

    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, thứ tự khi in" e="Order, Number"></header>
    </field>
    <field name="ma_so_in" clientDefault="Default">
      <header v="Mã số, mã số khi in" e="Code, Code When Print"></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="thuyet_minh" clientDefault="Default">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="ts_nv" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Tài sản, 2 - Nguồn vốn" e="1 - Asset, 2 - Capital"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngoai_bang" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Ngoại bảng" e="Off Balance Sheet"></header>
      <footer v="1 - Ngoại bảng, 0 - Trong bảng" e="1 - Off, 0 - On Balance Sheet Items"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ct_tong" dataFormatString="0, 1" defaultValue="0" clientDefault="0" inactivate="true" align="right">
      <header v="Loại chỉ tiêu" e="Code Type"></header>
      <footer v="1 - Tổng cộng tài sản hoặc tổng cộng nguồn vốn, 0 - Không" e="1 - Summary of Assets and Liabilities, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh_yn" external="true" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="0" defaultValue="case when tk = '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo số dư tk, 0 - Tính theo mã số" e="1 - Base on Account Balance, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="tk" clientDefault="Default" filterSource="Optional">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu" e="Mode"></header>
      <footer v="1 - Lấy giá trị không âm, 0 - Không" e="1 - When Value is at Least 0, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="101010---: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="101000000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [ts_nv].Label, [ts_nv], [ts_nv].Description"/>
      <item value="101100000: [ngoai_bang].Label, [ngoai_bang], [ngoai_bang].Description"/>
      <item value="101100000: [ct_tong].Label, [ct_tong], [ct_tong].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [cach_tinh_yn].Label, [cach_tinh_yn], [cach_tinh_yn].Description"/>
      <item value="-11001000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="-11100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="-11100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOGBGSbULAo4JjF50SdU5j/k4hCsJVktA4WHkfS9dJ1p3kzQD2EJAWHmoXtJurM0ONQKEvx4c/9dNB24mxJg6yk=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOGBGSbULAo4JjF50SdU5j/k4hCsJVktA4WHkfS9dJ1p3kzQD2EJAWHmoXtJurM0ONQKEvx4c/9dNB24mxJg6yk=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVOmzYsxzwZmaM8SPYCkcSiEXJ82LJ0yyLXWxpiYC+cq7RQVXfUweEqezBg8kMqU+nhWVQ1nGChQEZfSGJ5GkuouZcw7/CHQH0eYH/Dz8jHSw/hyndP2w7TD2Djk9cfaEML/oW7hNJ2shBsOZHRt6dAQ4kAn7lQ4v5ZtQpaALbKh9Guifo1z5jFUaxrs01djG1I3D9BnbTAXe247Iz+zjpppafJ5JnlY2pYwx1HHAzmboP77nObvVn2xoWYxd539IXURv81XV0xTtSRfI6i9K91wKkZK/cJLoMqKObRCpsZrIX3BQa0T721HNJ4DrH4Vr0</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMYxvEtetLOcyURkzG45VAmiQ3l4BRoP/j8QXxQKnYdoJu9Qez7h2oWFD+HBwOOo+KuDW1xb5kYa5/fSaotNwgA=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ7mAVN7FY2YRq3l9z664Ytho8zQVyUYsEx4xech+wml7gK3QKldDKCj3vGR2j5UFwPRCpbIv/VQ8w5FVR1PkgQnwV1DJb1S2eBtq1oKXHphtzv9YU8VoOC3yFwFstHArOPQZRodSfnDTkrNRsjvzgoL+ofMUhz1nTH6Z5/78PQ/irsmqHlfI0xLhiygLaotF6d4FSfyXmis0/POLlxwXLhNl93a30GzntqecnCwsUm0Rbgcfc33oEzQizW7OZDo1bjD6/SrX7HA1jdhFL0qV0n/kGDmwxkmu4o0Hffyiy19DlzSr6rxvks08yBdsmMSlpja+y4wQuExXijluzh7vz3QlTEcMtTGuGEDIm3yOIKisZ4OrS+bb9voqoi+/iDY6GQ==</Encrypted>]]>
        &Check;
        &UpdateNormCompare;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHYpOzt8wlEaTtF5YIuO6qbIRHtx/Sl9nmGEuXPQyk+ksmRazGot3l4cVj1M/G/OeA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Set;
        &Check;
        &UpdateNormCompare;
      </text>
    </command>

    <command event="Updated">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cv7yAJXy9wrs/pchV14Y6kxPQNqsF2w4Wul9dwllL2jec2VkUd9aJXW6EY7olgRsrJdiLL2N0f8HEMj1f/p2Sy+QteNbvP0R0Kt/e5504xqbAuO2YtFo/maloMbKxW/GWh92CbmbhHRxC6JyYZOmPc8fjOofS6B8SZ3Aywa1gJTVQZRCoULZaKirQOXC9NGeG8HD3NkbofaSYKQbXcu+revwRxcG+SQyKwEum+aJsjOgzxj4ExyDKAiDNCjzT41IeXi+vaFeVMtJs4nNSC1R58ktWNyjq/4Bc9mNYEzBNx9m7VhFlbDWVe5e/Mgs8/teSeYNqlJUn/uPLoACN5s3sIlEX2Z32PXtJDtVRQmEO4T4keVua5rckWBUDJ0/NoUhQd5LGGiFIH8WjOZ1aIEl0jKeAn9/8bWCZ8aCXXvm39uI=</Encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbcKe3zfePI1zHcX2XFblb5ttbYv3ucAXVkHy+u+ALSyPOrx7cdy6Yx5jnnjeuZS3Uk7qU0bDtJiPvmf+j4DOdRBTQ5MbiyQyBxCOkVJVgseLz4rva2mPsQDfdJOxYhF59FYsCPhX1eAyfYnszRsbTqVKwXcv0H0IUSm5XeouwNsXaZZTr/Jjciz8kQ/b6wu3kTdWNe/TlxSO9UUeLxkv9cmJS3a1YjF746ZGTuGeHzu/8XB1KYQUUdyy/fXj32e1V1KjBB8jifsfhrasNDSNtypYmkFzEwxb2r8UOxwSdb2nCLOOlHuCbrNzYyGs30mvmrZzXSQ/OVYmD6QkThkSHLoCnqD6+rOtvRUzlB0RiVfimdrcYTlhfXXwsAkaEUvqgxlCmVS6DozdV8lwNhz7cPUawLX0IJBKElzXkZBaAt9wRc++STtAZFsFKAlxbYcR0SeJwv6Zzkxhm2bXVS2EhpPkbRqgIO9Qj8GVdHCia2OPjI1qVG/LMl1ODS+G6esQBF3VOkY072JZHaC2CaqucMCredOV3VvOP5KSx0edNZFHiqGFeFhF1FKxOp0CGef2LJ5xBFPzK7z0PrfNEPpBBDuyqxFzNBI4XG9Z5kSCN9EpHIbZKv4IwSR7XrJ7N+6cYXt8QcXTDAqE1LgkjiMDH6xvAqU9EQmN4Tg2KSVFCjtfWiys2tpZGDuQ918dgtfMWeYH/G6J397A+l9XYo2O07NS+DJAkCyFLonHSw7K4VmdQRaIupd/osSEj3s4pT8bC5skYOiDvAhakTANcfUzaciMBNZsiSORPLhUNSUK5es0jkowWA506lvrAtT2aFddkz3doScD3n1QqCLxurl3ndvr2FOHPxEKVMQtTfWCSHfan6sThBdhnlO0hAvH2o3ud6dC/pKn5fLlT5hOreEVjqLZ0GFBqRip2iz4AVDNr6CmEWvLlnDDLuhnejjGEdHycks8Zrfy8E7fIHdcWGZ0TB2KJvcRUTSMncua2xXipWJt4NyznPdEFoisCmwgvg9HCaVwJSJlMWbOBWO0sGfQzU=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>
</dir>