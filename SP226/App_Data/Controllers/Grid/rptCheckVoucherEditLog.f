<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY k1 "stt_rec">
  <!ENTITY k2 "stt_rec">
  <!ENTITY v "">
  <!ENTITY e "">
  <!ENTITY Url "~/Main/rpt_ktdlctct.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "">
  <!ENTITY Fields "">
  <!ENTITY Seprate "">

  <!ENTITY Parameter "">
  <!ENTITY Session "">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhật ký thay đổi chứng từ" e="Voucher Logs"></title>
  <subTitle v="%c - %n, ngày chứng từ từ %d1 đến %d2..." e="%c - %n. Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="idLog" type="Int16" width="60" allowSorting="true" allowFilter="true">
      <header v="Lần thay đổi" e="Revision"></header>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hiện thời" e="Current Voucher Date"></header>
    </field>
    <field name="so_ct" width="80" type="String" allowSorting="true" align="right" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số hiện thời" e="Current Voucher Number"></header>
    </field>

    <field name="ngay_ct_log" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày chứng từ" e="Latest Voucher Date"></header>
    </field>
    <field name="so_ct_log" width="80" type="String" allowSorting="true" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Latest Voucher Number"></header>
    </field>

    <field name="datetime0" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowFilter="true">
      <header v="Ngày tạo" e="Created Date" />
    </field>
    <field name="comment0" width="200" allowSorting="true" allowFilter="true">
      <header v="Người tạo" e="Created By" />
    </field>

    <field name="datetime2" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowFilter="true">
      <header v="Ngày sửa" e="Modified Date" />
    </field>
    <field name="comment2" width="200" allowFilter="true" allowSorting="true">
      <header v="Người sửa" e="Modified By" />
    </field>


    <field name="ten_dvcs" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="idLog"/>

      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ngay_ct_log"/>
      <field name="so_ct_log"/>

      <field name="datetime0" />
      <field name="comment0" />

      <field name="datetime2" />
      <field name="comment2" />

      <field name="ten_dvcs"/>
      <field name="ma_ct"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCyp+ZxhgBhP411gOWClYh/BuGxse+nDrkPNCqp9dEwynRdRfwelzSqKOKczopLAZRhlQixsDnoA4qK6zttGF7nS5f4OvO2RatRL4Iu6DqKk</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJixJ9LjbiO0JCVNR/oTu7NuphiBE1bzHgmE1mq57htsC7QQUuBz7uYPue5csCmPrtBgdRjFkx4LTm4lcIxb9mOqUCikPlT6T0IKmWu+JORK</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFP9rjGXjWsXlpU0KHg84/uOOk6LU+bZZyIBL4Q6BK1ENJf/jHIIb2PvWCwbttx2f9mvDd5Zk+TlVO5O2AO3xbMZDWX0HZg4sgZvwXUH+LSd</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtULzPpeS9DbSEBHGDJ7HaUwZ+e7ppcDrCIwQBJNQlvccDTJHxPQv0SnLhUMdORyZWvK//jgxRN7lVNgKdQp7hCNdNnTMSZdxobVfetGDy8r+er6Ymjk0yt5uryWMfYHf6EuNF/Rv3s35U1zwE6BA526cZu+Wt6SgYgBkbpaotwqfEYgsa4lULc2TaeELsALMGqdxzSrWptgQjen7mHfr5z1aOvv0refLb+gNJxkAZWEDU7HLTXzF/TRuOvyg85BXKRUXYGQM87SXbwszlfRztg9ww5fWU9/cCGQjRjIEEkNH7kswDExEWxDsX7fPT+ccJZpeFcCWxK9Wqccz3f2MTxefYzlcRpLitWTJ99DSsEYrHuq+1OceV8y86RmA1o5UesBsxY8W5m8BHkewrmoBn90R5MRKx4xVWuXjkf8nkMitD8gm8DN6qeAgB7OWTkFfoXzv1TVCf5O8XoBE4/vlFFs7Ix27BXVDBg2Ejv1If9HRn6nsUKk2uIBnY/UqGWOkSmbUl8nA37o5DmjA/3wm+RYmd69UHCnTKKGTQjyM6x2mMQCa5kTqOpLZzwQZS1gB49VQKEEzhSimWU85BrlD5u+NeCuPTQC8vSHwqiipfiUU2EfmCuOOpjatbYFS0zwGesIpAeOTWImp3b2xPcNJkXq6MmW18+oQRr7UgKktMuoXZTTJmPO8ddVyroJEYJXwJdt9jcjW8aYJ7GvwIfBZGmg=</Encrypted>]]>&Url;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egVc/EVWcZ+SVyxUu8n1eOBb/b8+f7j2w8IOl0064oqIbtVIf8U1r9l4m2um7j/qB3Q==</Encrypted>]]>&Parameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f5cv01dnfQ7A7D17EAqD8DRR6xdEWAvSl+ShUAWXm3MAMp5dOmyz/uvJC5Lbw2nB1CuHcd2BFJ3mXJIv96c85EMDyxyXB9NLk4vE57xPcPKvL3dFT2pHHAVOdj1GccAQtXuIzzsBzNIoYZbptjt+iyq6Y9xwQAnAUigXUuFV2p/HBr2HIRt9gMUY0byIr0l5l3rhqYJlaZX0jvYUCKTlAaIT+yLzSYAclgtI7xCZKIanm6H5MX7jwxloJfFXICbahv5Nua5JEJBAM0Et1Xr6TffiojA0N+hVAv07WuxJLfat0Uy3srtWqxtIHGTujGAJCaPXXuEPtFCptjh3Dp1xFIkXZ8WmukFXLeqDMVzS90wmnvn9cNtE7Tn5ODbaKJQ0MaaFULpV0Cc5xrCOr3GRudAfto+Pawy5Ujn+NWHUpCpS388/s8j17TsHATbzAuyz3zCGkuB83Dg4g1PcZiHCjVLVDRH1q8AWWzpQASRVyJr1G1rm9IiPA23jPPVUW0rBQ==</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOjJRRiCXGQHDQWqIbzEUnAHe7PEMKinfYwOt+1DnlQ6PnApqoNS17FBEgZFSApHKkBeQ10Q40UN8BI4y4ntLgUOgFMmO5PLF64tUus/PX6411ku3CMiK/qXel53Col3w0yL3wJ4s4qbNqeFQj8FkzXdvEMweRpknKDbhu7H2wML7TzRbx8E5i+81PGPblaRY1omfmD+bh7fqRrP6gUTG760kth+aA1TcZx21/z389CpXw71/CG9tPdT8Hl10lAlFOA=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6ywOe83ORYIz02cyds9mXRS0s+SiWSC2DV+VRsqOfv3C53UyUpfGfpIQYp1eZzPtcZ3CEYm31eZcYOuf7K4m6m0GAjRgchHE0qXDzPxrbZpL3GC80pv1Tvge7ahJhEKKUv1oxkvWA7tkz+BGdlY1ONYifMRvm2ZalJt/bJl2dETkaXOQ9LeZqtZjl8mU3AMYsxPsxvX2xSk0buUsmBA7BUfa67fu88cya+0bTY9AT6/fFGZj0AQM+lgIKd+yfsjWQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="ViewHeader">
      <title v="Xem chi tiết$$90" e="View Detail$$120"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>