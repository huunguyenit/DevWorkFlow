<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Code  "HK1">
  <!ENTITY CommandCheckLockedDate  "
declare @$lockedDate nvarchar(512), @$NotAuthorized nvarchar(512), @$d smalldatetime
select @$d = dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1
select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày giới hạn hoặc ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
select @$NotAuthorized = case when @@language = 'v' then N'Chưa có &lt;span class=&quot;Highlight&quot;&gt;quyền thực hiện chức năng này&lt;/span&gt; hoặc &lt;span class=&quot;Highlight&quot;&gt;truy cập bị từ chối&lt;/span&gt;. Liên hệ với người quản trị hệ thống nếu bạn có thể được truy cập vào chức năng này.' else N'You are &lt;span class=&quot;Highlight&quot;&gt;not authorized&lt;/span> or you &lt;span class=&quot;Highlight&quot;&gt;do not have permission&lt;/span&gt; to execute this action. Contact the System administrator if you believe you should be able to execute this action.' end
if exists(select 1 from dmstt where ngay_ks >= @$d) begin
  select 'ky' as field, @$lockedDate as message
  return
end
if @ma_dvcs &lt;&gt; '' begin
  if exists(select 1 from dmdvcsks where charindex(',' + rtrim(ma_dvcs) + ',', ',' + replace(@ma_dvcs, ' ', '') + ',') &gt; 0 and ngay_ks &gt;= @$d) begin
    select 'ky' as field, @$lockedDate as message
    return
  end
end
">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán kết chuyển lương" e="Salary Transaction"></title>
  <subTitle v="Kỳ: %p, năm: %y..." e="Period: %p, Year: %y..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="stt" type="Decimal" width="100" allowSorting="true" allowFilter="true" allowNulls="true" readOnly="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ten_bt" width="300" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk_no" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_co" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="ma_loai_lg" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Mã loại lương" e="Pay Type"></header>
    </field>
    <field name="ten_loai_lg%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên loại lương" e="Pay Type Name"></header>
    </field>
    <field name="ma_bp" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên bộ phận" e="Department Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk_no"/>
      <field name="tk_co"/>
      <field name="ma_loai_lg"/>
      <field name="ten_loai_lg%l"/>
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFediiV1f7we7zXVySD7VYofePQokWSethRAf38MlgREipn4605eBMJImgjVcX0PABHFBqrn2mkVisrY5AHdjX3tW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWNR9/wgMN1ihxLV9mIkT13IHnKFEuf3iItxtkODNqevpjIByAz8CQy5p3kbYgIDiKJcWni5KbQ5Jw+Aza4od5e/D7uAKfkQKyiOakY7wyZhZ6H8/XQxTE+XYEsLY8KVQ+IbqzKNrtthZz2aAcPJPdywYnVnZV/qeEZehZ2F4pleubPJ88A/yWBhBmlVJ/2zJn7kP69ume+nkNjxPbX6Ag9kmLsjrRLtU1WSF2eWCrY3OegcY5WW622awm60JyPFVsyHhJv7v51bXSbBCpVf4grv7In/ql+PigUbitQvR0FKkSWQzqb1Rs9siD7nu6cE4hnkBT4QXln2ul//tPhlOQSb/67UaPqJwfeZ3ir0x39sb8F0NleSNVyp86Tc5TB6FwCUqLp2QWPkmSnAw+3s7P8+rR8aRTg/e824UfrNrtPhN0QkKd1SLFA50va2m5vKTwjzX6+WCYBUYmo+REIjiSLRM/XTURjBIAGmMUdwuHXvU8NbCUZiyjkVB9QaeI7G0g9ndfB/uOUlUPaNBFBRdfzpKUEUpa/ynxUzaKJi5FAdSDkEqI3/vXIHEvTmbtBVto+xqGShDY7ff0O1dyGW+AVE1theykQNW0ELPQz5vsBaqA4m2RgL4NJPEStzb3moD/hXPb4QXPn2uklFOZkwqJ/gLZ5dT6xKDSuVAVCr3vO2qIro9bLNBdkQkhEBLGf3uMNIGSbmute9kznwJl33JcYBRwhd7th3ucc0LiQHwSzOmkVVhg1ZQAMdqFp4C4hZyUvkypfwPDFNCSpkpg3kTxQRUXFasExlm5X6AEsiiRd7PkdjjPG/O5DVdeKqy0G/1b2fbWsFnbj4x4AdxHvaQPFcyge5Dpg7Vxte+loIq3CXv5sNz5VCNsMF/6IEkbxJTNmfMInrKEY8R1gsorwhSMhH1Gseiyp6sIoD7GQTiJwb9mxM3w4dsg3PU1jRYRnHs3DR2IMoTSoXGUkyiJDuMTVGKlBCiYm1n58Osal3FnmUiHdQ2mgs9F8Kzy/ePhH5EYuCED/3qRuhMjNz0uGdFWB4ZC2QpfvLlGShQLTmEtG9OYwwk6Ke4K+MCVMX79nBZ2xqgE6v66c4teDe+RSlS/qONYSt1/qJDkg63uRDQV7qGWSAGpICEc6b0iQNPeQEflkEkuJ0GAuDfyp70Ngq/Syp/lkcKepm1eRXhHE6afKKcq6EaZsSI2Ty+ecWgdWn+Eiv2QUn5D2NFNG62Vn9xY/6i++PaZTdEHL0vc8m/W5emIJ4walicBjr+69PM8dvS3e83K42j6MA8fcj8vF0beb33qR/HeKW85veCnbJiOuouIzbKyBRbSirDUnvRtj130rFqVdkD6TZuu2jbIHJaoo3CvFDLRo+mfktx9TTQ1i4ynRenxqt7vrg06WJhU939ku8f4StWTd/jKvuS83DlcCvPz4B6rOiDJYbwBJsi+BnNpBEgHcv0sRxa+tr4nO4543adi4VLLnjUmuulkYPcUyEnn4Wr1plCodRIC7VIegSehHtOKpNbRpvpLLrc5KONQQpryTMx+46qVC4fpGH6wT/7LAPBYCzmLULgyguqV0fgjXOC9HscGLuvZIvFsWMmd9pApfeXxDQspFFbYuJXYc0KeJCEriaGhiQ1k9WDCRxzTtAyGPpog74s9JK/yKgpFxZ2j1Os7RX70T3PljkpRJ9QiRueNL6Mu7g0xnTVvJZ58HYFdDCSqlyj40gppotYzVc03B0JC5EzqixLB1SDQQYfkjwqY9XGqgpmQhNCA/X4JHs2SS8FGpMPb6zJ1nX8Q==</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/JvPfwP/0uameqPGd3GqBr6leQ8HkCZAtLltzgNygnLa4MkQP5kjVvpjqfNDMUjSXeacUxMEYe/BuRR3uVUiEJn444LecXVyfpfVTbKF8ipQ4NQVL43GzZ9JCc6bRBUYSOMjDhOsq1mKFu31boOmT/g36uTRerdyyk40wBP/4ymDDzKLIRGVEKIHYQrEynRODn/jLqAgGUWhnQpQfW3tbh7uNgbhSLQ3/Dnkyr3+SsDLgm4fDJjDXEBwv+Q/BOrRw==</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Transaction">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1+Pgf9NIWpQIcrgh/QGVisLfx3Mie6TzTmpRfwoH6tqE0dUDdoEmMCk12yQ0speHLXWzqktydlymuFsHMqEPM9TxzcF7a+ThpE8CKHi+ZjUcOFmuhIUlgv1V5X7ivYpuv9wJHrpqjaaMgygjwRjHmBQiVHlB9TyJR1CKW1Z9cZf3hEyMBakvdqqbBWvN9d/hJ0Q6jbXpleL05B4D9WAH254AhX6sIYvVkRcfDeTLevrYdWO0EpZXW+bkQh0cKZDw+qBucop+PplGOBIXpIexWpKe5kGXkUKs7CL9iJ52u6TE4Wb6i6XxeIKO04RnhQpxRTgFG5okOMbgoua1Imv6yDJlHrao73cLgUQ/y7zMy2zrWMbeXf6/J8QUvyD6yaoxO+P76tSTIxBCo2rY/FM3vn+UtCPxF8TDXBSSw+HlpHPkklxr9TdjDltN1EuATWG0tjvjRSyB9NrHcVUJ5KphKF77vw9NgbeoUB0JQmZmETx31TkQhkqtqDMeQDIftPHif6JByaHS20oJLS49yUUpcfoKKFzI9QKBg4WT6+6+8WmZZkErn+S0cBtwgm9tWBLVIcR2toQiMW+bx7FICpFQM/uSegblc0a2IesYbld4rg2pkpV7ZR/2S6YBC6g6mLeZVCb8WUjWUuUqFBHWHhy0WoNdYRwYEjceSF7kA6NTHyB0qEtdu2mtgyQvzwhU6Zcpt0rXRYBB6OS75hx60CVfWZdmH9qkFp7tLdLtexc5j7cSQMqoD0hPS63cv0uzovqjLy3qQ+n/xniKTN045OBylO97iEASLNiRJDRvkKuylHQL3yqk2nTl/GA1kh0xzjPKqvGe8PevQ/RgI7Rz4q+mgjR3aeJk5HmPeBH4h3rb82FXFZLOaoS0gfP130YiiC6YlJRhxBH4qXpvFe8Ff4aEutEkOCU2NiLeqVWkD4xymZa</Encrypted>]]>&Code;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFPh2/3nMKit1zGKebYgdQ2UbN1GBDTHLVp7JD2JKSVWyGFnXxHWaO1RNVfcQByI2EQUBxTvVW/Vy2bDZ+rk0HG6MmkzFX8kS8afA39O2z703VmHyz3fQjwq+GoSa6XVgkbfBEE82aZM0bqXz6DPs0cqDcIckpABK+uXyBCwcScEU+4FG4VrMHzR9CyNJSUefUx+WYGRCppaI4aDPU0AwNYpOSghEKb9H+HipqIK0rd6xqd+rM1OuspH7VHB7SzS/DKA1pk9EKOFUdnVISnycsDdJrN0Fa01bemQFCgjrrdyR0shOUYcThGSpd+p8BDKvPH5Ej1LErhcfu8OBwg42w27vs9y+iEf4wWag1uetxZMxn1gUGwsB4uj3wvL4Hrzr/wf8UVYXzcI9pyhmscfnMwwxQ/d3HZrp/j0h899hbSxheMeQ/B8PozDqIDS3bio6AjagXqqhllreP5DVCEdZn8qytxoj9ttFwltL24O+jSI5/0oPjqjMMSnifEAP/KK8L492seGqIGNMYPIUJYp5xARz+mxkagW3TsNIxvJiSm3WA4A7/nrA2+sq9Cdj/JdddZMe0ajc4omwh6Qdeud1XyhBoVnBLeu7AIvvlZJQRX10</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="CreateTrans">
      <title v="Tạo bút toán kết chuyển$$90" e="Create Salary Transaction$$90"></title>
    </button>
    <button command="DeleteTrans">
      <title v="Xóa bút toán kết chuyển$$90" e="Delete Salary Transaction$$90"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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