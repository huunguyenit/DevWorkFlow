<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="phan_loai" clientDefault="1" filterSource="Optional">
      <header v="Loại phân quyền" e="Type"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Theo chức năng" e="By Function"/>
        </item>
        <item value="2">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="3">
          <text v="Kho" e="Site"/>
        </item>
        <item value="4">
          <text v="Giới hạn truy cập các báo cáo" e="Limit to Reports"/>
        </item>
        <item value="5">
          <text v="Theo số liệu thực tế và số liệu hóa đơn" e="By Physical Stock and Books"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4VDFFeYOdqSMrkwlhzSGnCvHtAbcRisEUsc+CVxgxtxejP/FOL38mL76aTyEvL/7RCXcZgZUMxNI61LEhPqK9j7m90bVg0TB00+5QldCPzN0A==</Encrypted>]]></clientScript>
    </field>

    <field name="user" filterSource="Optional">
      <header v="Người sử dụng" e="User"></header>
      <footer v="5 - Theo số liệu thực tế và số liệu hóa đơn" e="5 - By Physical Stock and Books"></footer>
      <items style="AutoComplete" controller="UserGroup" reference="ten%l" key="((admin &lt;&gt; 1 and ('{$%c[phan_loai]}' = 1 or '{$%c[phan_loai]}' = 3 or '{$%c[phan_loai]}' = 4)) or ('{$%c[phan_loai]}' = 2 or '{$%c[phan_loai]}' = 5)) and (@@admin = 1 or id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1) or id = @@userID) and status = '1' and user_yn = 1" check="((admin &lt;&gt; 1 and ('{$%c[phan_loai]}' = 1 or '{$%c[phan_loai]}' = 3 or '{$%c[phan_loai]}' = 4)) or ('{$%c[phan_loai]}' = 2 or '{$%c[phan_loai]}' = 5)) and (@@admin = 1 or id in (select distinct id from @@appDatabaseName..vsysunitrights where dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID and restrict_yn = '1')) = 1) or id = @@userID) and user_yn = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ten%l" clientDefault="Default" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" filterSource="Optional">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" external="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="11000: [phan_loai].Label, [phan_loai]"/>
      <item value="110100: [user].Label, [user], [ten%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1J8yPpaoTWx9NVlXoTCN7y6Qzw2sx5MjAwrnqLcXkCe/xtMdZJ2tZy71SMfJCZYYCM42egOgUAW/fRRAHAlXP9QYyN/6zaFrp41pattEv/YxozxA9Vqj+E8Ay+3ODR4uZLh8IOp88V/TC7N+ZmSOpZ6MNg0UgBT2G1kCGv0LDXQni3AYHt4zHLYiA7l64yNN01cQr5kjKX7CZpmBDMBR88e3VSUIQbP2mVrpt5PJSN6ysxa7aNJ7exs+iZ9tPlpZ6uB/GrW2ryAhpjmoFWx0EQ75WLik9OF5wfBQwlIcWKBLAxHxXn5ePmuMWILn15xPRMzBR6BjhQddXsMB+FWug3o3eugF5ccbaSA670uvOWPvyEQR/Xqtx1gvQ6I0okyFQ4gaJWgK2cqzIZaAdtu0Q2dEL5RnXLNbQpXBOtmQAI1QN9eu3uswPPz/NNOfOqGqWZOWp3toqXY9S7tqLmBk4GXVN19FNS3Lsvt7sJ4IyMjCmt/U2OspZE//MbSf4gcGNsTPTFyym3amQ6aVAqkDXsC3KLBIlmR3qh9XZl7E/QjdS/7YHtdfhX9mk5J3tCgyj5B3PPmKD8x5N2g7kKZT3n/xaiq1d+mhwR2z51uWrIt4lojEzYFtuKl8kpeDyFI2F0kWNZc+QSgl3hXjXQkPQgYr5Tdt9euZoGkcOC2J2Xw4bqPl6QDi2SeP2iJy6wkHnpWihX3/rAbp3IlM3Ir7OXsEBtJll/WrChGEejkMA1VF711Xl2566Qod1hwuJhETwL+JskxjL05yMTS7zHuqZ0yu7ruQ1Anmw7u1hoH4oFgOw3mfTacDYamuQ25qB1HDYQlEYhDhV9lJTqX2EIOHZS7LTdmlGp1XlOygVB1khf7</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &OutlineEntry;
    </text>
  </script>

  &OutlineCss;
</dir>