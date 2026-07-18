<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "GLTCPT01">
  <!ENTITY AfterUpdate "exec FastBusiness$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @kind &lt;&gt; '9' then @cach_tinh else '' end">
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
]>

<dir table="gltcpt01" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chỉ tiêu chỉ số tài chính" e="Financial Ratio"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default" align="right">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
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
    <field name="dien_giai" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="dien_giai2" clientDefault="Default">
      <header v="Diễn giải khác" e="Other Description"></header>
    </field>

    <field name="dvt" clientDefault="Default">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="dvt2" clientDefault="Default">
      <header v="Đvt khác" e="Other UOM"></header>
    </field>
    <field name="ghi_chu" clientDefault="Default">
      <header v="Ghi chú" e="Note"></header>
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

    <field name="kind" dataFormatString="1, 2, 3, 9" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Biểu thức, 2 - Số dư, 3 - Số ngày trong kỳ, 9 - Tự nhập" e="1 - By Expression, 2 - By Balance, 3 - Days of Period, 9 - Manually Input"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99AcR0gYaJfcvr5BPo9vxtz4LacGQ1YxVDpitiwy4L3ACrdEFlpEhs4NWZ8oisGbaLg==</Encrypted>]]></clientScript>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
    <field name="loai_sd" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Bình quân đầu kỳ/ cuối kỳ, 2 - Bình quân các tháng" e="1 - By Opening/Closing Average, 2 - By Monthly Average"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 25, 15, 40, 20, 100, 20, 210"/>
      <item value="1010---1: [stt].Label, [stt], [form]"/>
      <item value="1010001--: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="101000000: [dien_giai].Label, [dien_giai]"/>
      <item value="101000000: [dien_giai2].Label, [dien_giai2]"/>
      <item value="101000: [dvt].Label, [dvt]"/>
      <item value="101000: [dvt2].Label, [dvt2]"/>
      <item value="101000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-11100000: [loai_sd].Label, [loai_sd], [loai_sd].Description"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVOmzYsxzwZmaM8SPYCkcSiEXJ82LJ0yyLXWxpiYC+cq7RQVXfUweEqezBg8kMqU+nhWVQ1nGChQEZfSGJ5GkuouZcw7/CHQH0eYH/Dz8jHSw/hyndP2w7TD2Djk9cfaEML/oW7hNJ2shBsOZHRt6dAQ4kAn7lQ4v5ZtQpaALbKh9Guifo1z5jFUaxrs01djG1oxRTCun9s5X9PfE6ElqDUeUNkmLJOpqwpgX2kIHjbTxJdyry+ARIacEqbTdiP5xL3cxgrnfjs+SToCZgSF6pdTsnLd9tTwQR7kc5yyFXkAXdRoeRvJ0OLsBpV4/n2uFd</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMYxvEtetLOcyURkzG45VAmiQ3l4BRoP/j8QXxQKnYdoJu9Qez7h2oWFD+HBwOOo+KuDW1xb5kYa5/fSaotNwgA=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ7mAVN7FY2YRq3l9z664Ytho8zQVyUYsEx4xech+wml7gK3QKldDKCj3vGR2j5UFwPRCpbIv/VQ8w5FVR1PkgQnwV1DJb1S2eBtq1oKXHphtzv9YU8VoOC3yFwFstHArOPQZRodSfnDTkrNRsjvzgoL+ofMUhz1nTH6Z5/78PQ/irsmqHlfI0xLhiygLaotF6d4FSfyXmis0/POLlxwXLhNl93a30GzntqecnCwsUm0Rbgcfc33oEzQizW7OZDo1bjD6/SrX7HA1jdhFL0qV0n/kGDmwxkmu4o0Hffyiy19DlzSr6rxvks08yBdsmMSlpja+y4wQuExXijluzh7vz3QlTEcMtTGuGEDIm3yOIKisZ4OrS+bb9voqoi+/iDY6GQ==</Encrypted>]]>
        &Check;
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbcKe3zfePI1zHcX2XFblb7gp7SE0yITp2YxulwQH3twgkCbEN+Jfqq9weHWw52lV3CrCkp1S30e45M87VqKhTkFo1i+1L0gwRc6xQtCQI3tDfQqqJ9VQcxvJ3bOHOn+TbJcp35YVEk48EOMez+MHDSyRkzUw0qp2GGxJCm305PM6k+B3/HzrHlyzjqvN/qjCXM3DVuSPCtxYuzKevxHUMPUaTc5VVy5cwqTK9yhqWBfySBRhHxXHejHgWyIHcBeNS3cPbA+olL4ob8VT0CFFqQ62LXICEa15uDLYR3IUH/R9+rNq6AdXRwQJKQtIQuLvV2jjXXr/bHTkyfxB7HyJQS8tq5I63pYalyjlTMazbzQsCeCe3B1o9xzUaxatJVF6J0atknqbxIcE43IZp4N1rYcPe1T4ruy1RzDz0Z40tCYAB5SPyRtgJJM49g8bhRcKKHAZkRKwyIx+osLxQWvtXMBK6y1LloqibKNykJbafXmnitTXw1Upsfu5xEoFrBQb7HPO0LteUqY9qMy+PLuM+GsGPIA8HfOxt/QF+9SRa+dMDCFg09OR6cg96uokm+AW53yzgWQTar1frCPWhFLSOu2wlKnQ2q1Tj9lsU2KZG00CLwhzCB1vgSZ0agn11c4IeDMEukXc+GhOMRjmuBP6XsjwZOWL5REtiBgAslgi7LWDyl0etyMhcukZ+hvyPvy2bESgXVMQt6bGRhL+DiH1tqAtEF8miAStvl+2cD94QGtKaZYplJVxfKxdpLStXpH7Gv8HLGIGRv7KjwEgspwqB0=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>
</dir>