<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  
  <!ENTITY TransferID "FastBusiness.Encryption.Begin$us12D/loR/PH36Y/kWCWUeY/xcP9F5f3l+T6OxdH+JZTNGISMd03S4GJlYi93siBFastBusiness.Encryption.End">
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaowbMcQ9hJRcjONtP2aLcPfffckRaCjo5z4FBftietwBsfZ4XGjh57nFx0nz9hLAYMtMP1AqNohG8OVNppvEJo6j3Ep6MkUzJTPWY2zmxkMSxNU0+yWwU3JbbJ700cP5mBoQFiZ+kzuDJECZN69Z+MaGCMJo4tk6isMdheGxRxFg==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrvaora$000000" code="stt_rec, thoi_gian" order="c$" type="Voucher" id="H04" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Lấy số liệu chấm công" e="Timekeeping Data Import"></title>
  <subTitle v="Từ ngày %s1 đến ngày %s2..." e="From Date %s1 To Date %s2..."></subTitle>
  <partition table="hrvaora$000000" prime="hrvaora$" field="ngay" expression="''" default=""/>

  <fields>
    <field name="stt_rec" width="0" hidden="true" readOnly="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="thoi_gian" type="DateTime" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nv" width="100" aliasName="b" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" aliasName="rtrim(b.ho_nv) + space(1) + rtrim(b.ten_nv)" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên nhân viên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="300" aliasName="c" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_the" width="120" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số thẻ" e="Card Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tg_cc" type="DateTime" width="120" aliasName="convert(varchar(12), a.thoi_gian, 103) + ' ' + substring(convert(varchar(8), a.thoi_gian, 108), 1, 5)" allowFilter="&GridVoucherAllowFilter;">
      <header v="Thời gian" e="Date Time"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="vao_ra" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="Loại" e="Type"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="c$" width="0" hidden="true" readOnly="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="thoi_gian"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_bp%l"/>
      <field name="so_the"/>
      <field name="tg_cc"/>
      <field name="vao_ra"/>
      <field name="c$"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzymPAypqKLihYOMIv6op1ZKem9LRHGw+1RWvSYu0/wOevwqUF2QthjC5PlX5dM6u4ExFZCjnAQyhKIKa6ZTPvyuUzSJnQVhpN0a2v12zkP5q6hl1UGOO92DykBniq/yCq7HwseRcFEoUhlJbIMhmZ5nu1ofw0VV0gIxeyqOwQazc=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDQv+2PvzGj6IZ3jSlPVfvDls5ZDkrLmSvv9O1K4S6nL/HYE7r7umS3X8sTuR8ehTsou9c0zlEHvdbSLOf6CoiozVC+hy96w1yu0yH2/biK/</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRHrux5RuerUbBHGkdC2tVzoIlj7S95x1yZi/r+I1PYxzcK5i2np6jHV38kSgrpod6Hg2JiTb/r/FrXoUC3WXGPklA/p5O3BLEcsbCWvQLeJblu0YEpfOZcgAqXv/4JdjCljVLqZcb4Lmoe+swxs+ke3VozCO+qkj0pdADqPWARCzEuhuoA+9xZXL4enrTUGagkpeaZf/FdrlSGWOPAYbaJ6nuLX98UWxezIkoBtFCSFmcwc7Pdc1tVDx4Lz2yjlHUM7csjujbpkP2Cq61z3v3Ov0qyfFllKawYIhQnYCW4ig5WeClKpUfBPagp0t6IXvmNE2PsGch1OgOQiCdXLgoHuYdgTYsJJnyqgCYx1H97d3CPIFrLU7NtMcfZ9hF1mUAz4mBCRo6lkVeaTfMKuLDTH/FFHDU57iMlPvyHk/SqL/Ob8q+C6GjZ0Ttip5CL/zNlqScg75NbmTedQGVQ6KpCNeBsDWRarVwq1+g4fTXC0bQ9XyYooROCyTwSpes2tHENTwXllohYk91q0hvzHVsc=</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS66/5piosuC3lpHmFQcJasFL1SBjqCg0otw4ItJxYaioWop+ph2aR95mNpO78xRNyiwCFqKcHfOEFAnf7QtK9qlUKmMo0eDdaYKBtSMrejH1JxZqO+jjfJYEY9uY4SL63qADQe5NqAlJeqBjcB+LbItRpIUbU2thLqFDVbTBezhhNXtAxL6vKkr3GeGDgiMGlwrSWrJ794t1aF71AvQzuGEJPEY8dwwp3fMWDw/+ik1gdDXxAfxIzIbOniLrEFZkF72uCVkYS2+Lr2ZsEV+H7W33IhQEIz6Syxz8aJ7b88ApqwaofIT9AcbjQQaQCKa+v/YsbYDJh9+r39V9i76uWXEzda/w3PguS2WeeiCDdTd+Kv2PoJEtpgbALZMx34iDGG9vdhY1slLdZRPsh3+7phLz2h6bqsYN0DqefRz7aRo6Rm+dmIDslX56eycfghcw4HcxevryXVA01QtuWUb1gW2z2l9ZFpxEsNNKVodn/WcI1apsZ10Ao2xDu5L0RT3nb0ZdnUnFIrUhuFl0lr0ICL2oAW9BzkGlro3Iw2cmTL4M42b3rTnXMTkGqfovAoFW1o7bhrJZDxXgnqHoMqeQrRCukRQn8A81Ev6gtKBTpvzeRxeIN6EYXltNdFFRqbzlVSW9I8y9xMbta93tMTWKXN1i1IxTjaTP1zYqRjshsegiF8zedTlnOkhB8+hiNvI/0/6T7tW1l5uYXWj+7llSy9gDM6Z3VfF2P/jlvbL+P9ZOY5Di44xieSGwzsyjjS+0rASVLT6AJT9lcU9B9Bm3xlohjwJzjqnZ12BdcMQ5kOx1WfTFoALSqWxBJT5Sm2kH8/fMHzqZN/z32y8WxvNy81u/4CWG0P7TF2wDMEdahrFJXqA==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>