<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'GLDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTU4SCTETx7Ty3zV1ZWMJFaVU4Joz5SixRN4HAj/XlDChSde7nGCVM0fjAFZwTJa2OS3KW/Lk3+fXWY3PtQ7SDLWfh0VJRFhBUUdiHOTvKPp8X9D0ixjgrFZhXlqPhE+ui9mVxW3pTa2Gw3vZmV/jVSR8Ob22uStgw7+yDSuoFA+Txb+0n2x9QPVWj2e/UGSGXojDceM9moQiExW6YtpZ8VICwA7IiFuC1FeIntG2ZM+7lhZpZ9PutTDTK6BRG0qjNshzYQ/To6Gu6S9EnAWkpBQlHMp6VabmctHHOw7Rvkqr80f61kKRGcuOYWdN/e/kgIFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết thực hiện đầu tư theo dự án, công trình, hạng mục công trình" e="Investment Implementation by Project, Work and Work Detail"></title>
  <subTitle v="Chi tiết của vụ việc: %c, từ ngày %d1 đến ngày %d2..." e="Job Detail: %c, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã đvcs" e="Unit Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên khách hàng" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tài khoản" e="Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tk_du" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Tk đối ứng" e="Ref. Account"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" width="120" allowFilter="&GridQueryAllowFilter;">
      <header v="Phát sinh có" e="Credit Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1APqQO79deOcwejbPhGNP2/6iyuU/wuFddf1cd6ivwO/s5BERIVOyiXrssf2WNCZfVNPSkvsCFH0zYW8S8NVMVY5MAlNSUzvtvTfvSEUfmt12YrPJ3cFGj7CuB+7DQtiAiV/2KwvtQl8HJch5YtmXM2Zb2k7BvX55SKGS3pJLStNNnKQkkmw7zGlKl554lL34fHClKD9FtuBV3/PG8zOxS2OgxJi/Za+xt5O1B3EVu2SYPCfcV0VDcRP+L3/mVqRaUtdTqdqvzEh15clAC+b3ALJht3m4ahXoGe+w6GdE8z13ZUsTBOFCE2QZYvjO6luDeJIlCBXZUBzFoQRo8EnAg=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwTJHFq0I9n3jDHOgU+rOzD7a/TKK3pg8QC1pWUrzmCZP0L1Du8Pj2unYboDIQD30J/VHdHXBgxOro17Zz0hE48L4wJDaxAdl9qsJ1rxx3CuChEvIDrwwKXlhC/nXOGINjUATgBrCDlv1TYyZIivqaVhvrmXMb6NCIjqIVr/poQBTJDor3jXiZJoxGKM14dkB/hcHW/jx7XSUAdKwdp42RqPz5N87HAdo5tVVLsXicVRFhJTf+MNWJ+tUS1HEjU8UysRNR17jKEQukUPFJfeA6NW6DrmEHGInXCFu+gIWamgng4dJdfcZAxhV7gvSFg3kWnuH0C3dzZNExR+BKLCTHQIY63AaMr54tE6BuqgjiSV8CmnbBqgxNe2vxpydB1kk8qM2wvSp+lAZEZOaJSmzQ2gxJYsQ4yUtHONLYRvYNYkuoccO3hYE5R+NspAr4vVTeUHxhf+Z6yg5RtyUU3XpSBQP9X/4eHo+t0ZKqTfNkT/CEhpRcoAv75sTrjJXNjqTIqB2QuhRJgFRFf2V+BBqtaVETQpKq8chjEC1dEBe/Jv37gNmn+CQ00wudN7wc1jZPt3c0RH5jUQU9BByeYAtJAIebfGlERzkVLHH0qCtaupNYtLFTBe59Tm7WrvWOm+X51cY83daqIq2GUVJkK9uiRz2wQXwH3TttR2tf7eurr0uRRn0hZnmFmzasLP/grFehMqJMuik0z/EInj0qyVY7frndY36PuItBUYGJM9I+YbLfKytOLsEFL9aoqdCEX4JfKuMlVUz4/zW9Kg0NA7lx/CKcsmJGm16/+iuEBxmoFeUD8AsUVY8zXIQzPMxo3PIZykTG7zC76cXv2td8sD2FmZ/Ief018YdolLGmVMvs4Mk19osCDz7sZ8QPkkHAQmfRw6tmAWexx7fV7AL2etuPu6bQqmHvSjoCX/lJ4fOmJ39NSqZLYopBLRkE/MHhHSWobhTgN0vFzo4DQCxOYBf5kw6hdueqGasnXF9miIqmARudZUjPbRczvgNBOJsQ6G6skOpeGwDMAjZDv667yKopNu5CZgOc6d1kgKWN2jKTexufoBTCWqDC5FC32RDgSarp3omcW3HJlqY+uAmXVlHcZ0ZV32YUCkvpEboyQYkLosKnroHcPQS8IsYQeZSAlMWw/6W2AX+9wTK2w67fdUGi0vZXf2AIDeqXbI+XFWJinFJjg5BUgP/e3o8ASy6a6+8NnvSbY34vZXPBOdWTSF99E=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XTMNMevCkb1MuTuOu9HqxY0NSiX4FC5YiiXFc2+osTKB0Vs87zqbhEeGNOfI0UFABqjoVYbQ1Ev5vMgrquyTTx0KmLWogSCvULrQGozzaIifEgyA7XNMAZDVWu5NzqJ4n7G/+2siFva2pYpGk15V1J5yHTP11Yz2RWzSBTuQx989KjEh5+khzp7wLN+TsjpKiaDz4HiOsBhNI7Q/Khd3iqk9/UZ6rCwWzJ4VZZtZo8NAXmUwXI02yc8zypK4eAYJOWhHEqfGp8tlxM5Ker9ljJRcqqJZsyN2imsDpQXylut6nKx4+uQedzX1cEWwhSfA2dA3UxFs8nKsashAI4vxBwqBpeAvGY34YC4M0WuEKGuSRyyZ2TTtqMlZWjsCAXtiBYWGdHuGHzJcV5MIYwe8Nij/mdZDf1LdfvWjCPheayhRw8n3QVF5nz/8+0s1puI5EJFmPtkxmPjpjcj9nUpKMrIdTsRtniz+ATyJwCuxnRyxz470NvzunRb6UizrKPCA8snA9xzoWKLo8In8fxwCH8bKf9Wqt7qb8Xxa13FFi8F</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCvaleMTwKUNNOqFA4wkjE/vTTc98G5E1/6NlWlzmdzeprH5j16Jdmft/xE5NREOt2Icc4oVPv+Qweyzmp9U9eiHw5cDgG0G2+YIPM03O3x8jhUYd/lZoIXPzZtzo9MnYa7jSbb2IHh3F9x7excCzySbZZGinl7UgSrzIr97+YUw/HHrfVICChZMA0AVj51LzwnioI11rMolcBDC4hWErx6xXzxRKufgVSbN7KXjZ4aDFMZD2xG7HMgqlhPzATz8K5r1tLxWr13PnpLSi5DjqXGC</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>