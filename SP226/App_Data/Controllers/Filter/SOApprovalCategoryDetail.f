<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="soctkieuduyet" code="loai_duyet, ma_kieu" order="loai_duyet, ma_kieu" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="SOApprovingType" reference="ten_loai_duyet%l" key="status = '1'" check="1=1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PTzxBBVvUyvoGhZosf1w9ZWogzeUWr3lG/0Q0kTT4jCndoVFqTBYIOJX3Ql3PamB3vLbpp/Pwhlyrw9nR0TSGu5HcyB0niTvpRhUPESM9HR</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_duyet%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kieu" allowNulls="false">
      <header v="Mã kiểu duyệt" e="Approval Category"></header>
      <items style="AutoComplete" controller="SOApprovalCategory" reference="ten_kieu%l" key="loai_duyet = '{$%c[loai_duyet]}' and status = '1'" check="loai_duyet = '{$%c[loai_duyet]}'" information="ma_kieu$sodmkieuduyet.ten_kieu%l"/>
    </field>
    <field name="ten_kieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvcs" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tk" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="tien" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [loai_duyet].Label, [loai_duyet], [ten_loai_duyet%l]"/>
      <item value="11010: [ma_kieu].Label, [ma_kieu], [ten_kieu%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHtcf/eMQ6JNuhKdkli442IkYCjONuFR1nzXFS9nee15era//ZpJ28ZHt4JKxxI4Xlm/YG4C7wvTy/TEuotAGyh/OpdEu7vFppO0//mEMPAeWrMBe6qvYZIo2brLNES9wiuo2aixnO+dW9w4lhZm6tjO2OdVXPC/PT8jq4knQSQmsMl05m2YDrDWLOWZG9VVZxEU/Bk0uuuJjM3XeXkiY41mtFZanasZtCAkZkmCptSyQbyGi4ykm24n2Y8XtLkUjgvhN9UA6rZTcKbfIT1VbvAOcP3TZyuj5fZQEQVzqf7Y0wcL1OjP7IGwCYt0okIZ98BqJN4QYhbQZL16a3Xk0lCMd7Qt549hdo3X6ZrhpBepRA3AGQD/rxuS/040Y2zT7JfykDCgLBq1bZg8PE9KZYKi</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdIWyhhPd92v5o6BVLyei3qhflsc9QPOqLE6KpAGkST9lzkE2CeXXx6+awBx1UIpkCnM3+nzVIQ8JxyH3NGvs+jsByB46vIfOOh5Qho88jI8fzIIYQcBJnx2TtCkbEZCybhBsg9x6/D3q3anKxGjFpR9LC20PqyZ6OnNKqui2qEDWrM1TjV0GhYzpGLNqYLCR1HdEkCtdzcZzwhYPMCnTVNZbEafmlU3GR6CRtOrNM+fnaXyRHQRJSeEBNLhVOCBYKTmUA5lbNdp0A35Vhu/788Tb2IR7qeb3wWthkY9JzCVm1LLFvqS42nGHDbjuMFHw30L9i+mFPuHPhhmsScB0z7jvZA3qE00yMFgdlOoFsqAD2jKVTpaGWz00CpLSD3lCLZscZBOt+i/gEKszJ9hexyDmJGbJRVeS2On6fLe3vSJRImMhx3EDkzOx59H0EhLHdFnGvpzJNTToFawncIE1iz47Iz2GPBRwz4B2rSTkZsEHzZOCn5D6EA2tgRbxvB6bv7B1ala/2ATaBSdJruBRWBafHGWvEFd6ed/6xBMeqVLVLmqgoaptbIO0T8WEy4ygAuu4avahtXTwqiOIfFCgybKqWB+8W3SN9qSQ/R4bjg4RhJRb95IXN7HpIcW4qpihtX1VcBMuEGbx05wus1HlLX+2b4nAn1ty/d2lmOFZhoMv6uAvjn3vOszd6Ru9aa1/1MqJPpz2lJU54s/NAmVinqZhp5nzHPgBo4iZs8RbmPEZmiRbrBAYi5K5Va890MufcOIsx8OYAi2lf9TlhRJG3hUvq4Ik653ZV4fUW/oOqW80FHtZF7og7OXXTmloPissaacGQRwPXEHAfM2FQgs9ruAyTXTfbgi3zGHrwlgkkvDfuj6wuKV8iF9j5BMc19Wu3D36oz33cz06KrE42FEpcLI=</Encrypted>]]>
    </text>
  </script>
</dir>