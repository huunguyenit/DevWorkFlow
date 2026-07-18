<?xml version="1.0" encoding="utf-8"?>

<dir table="cdvtlc" code="nam, ma_vt" order="nam, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vật tư chậm luân chuyển đầu kỳ" e="Opening Slow Moving Item"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" hidden="true" readOnly="true" width="80" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày nhập cuối" e="Last Receipt Date"></header>
    </field>
    <field name="ngay_xuat" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày xuất cuối" e="Last Issue Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110: [ngay_nhap].Label, [ngay_nhap]"/>
      <item value="110--1: [ngay_xuat].Label, [ngay_xuat], [nam]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TNdakMw2KcvSyyMWw3SRErNguO+8TSmPfX6MpoGjZNOWbcALYzcKeSOxzxHQO445B/7HiAb8/6gkifLrn68mbhwH20FamfaEPhc3HGWYbhCIwMNX9mCTgpQixiRYGEnZj2lVdjTmWA3M2RglQLbwwTvoq0oHrMDUsxloaCUne/STwDOQ9hrS7LvCnpjq8wMHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf80xfUJbqmUZp2BPs0V5RosA0CIqWwqTHizIjFAFzfsuLqas7h511Z1ewKmTY9TDiUFKYzeaOsGD3bVeE6pHpmo=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cuceJVbNuj5giGWZ2jnR67ogCTiEdfiA32HibLEn2sv6TGI1TA8uRKv6Ly5d4hP7MUf5kSfHZs0WB8Wqjpev3gRyD0cyvL14T6uFzRjUmyqgesZlqSbSH1psrbuwniR/4RCp7zcKMN/3Xd9amgbwnkPD3Y/wf6dc5CMQfSwFueUZCaCloVzlWJEyrNnInUkWFH9F2lRDLTDNmL4/Z02avRlzqwiDdNgCjjavS0oOVgKMItWP75qpc5APw383Hj+U7KPuoLLWbtgRPkpZECSSlgIe0QiPeUijLVwshG0nigqGYAAbTBO3wuacCeQm3K/zL0pbSQXXsTJvaG99Q3iVOzww8bLf/NTUTnychcFH7SzuB5EhxbuP0f1N6P40ekIh1c=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0mMFfDVxDi/gK0EjRIKqAG0Pss5Z49H+KsMHQDg8MpXqxLmd+jnSWr3AdvE1vJTm2bKQso8Ecm84Ytuh8ELp/N2F7ocl/wqC+SlXtoPrKxEVRs55wDliHFRqyz06KN3B9NxAnf+TeYX+DNOnFlmEG8e/THhqPIXoPOOx7zDyZ5W/</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE81gubBe0B1ueTRifxICBajTFz8ztHSW2wxzkZYI6SV12du2+wOP4GoXTNbaCGtB2OhDgNPJQYfP/wM43GdBJMsDCVPtRxpMphwwmU03JUMFLoc2QqL0QPBhmy3HcHUGUnwH2NCkh7tu9KN8aYQl725tDNh/AY24/Ldzxl4AxFxdg+ZnhQhP+ayCz3twB1GWmQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPAd6QQxZB94LlPdThAhw2/2acYeg53kqDg5cDLYKfD8nw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukknRD5WubL2Awfk/Miy2fVJlEx1L2Id36kh3VX9KgoIBkXuwfrxRYiCeiITWugPFnSMkv0fJe7p4oytkh9f4YaAvz07gBwQVULLRPhvxku/H2lU6P2ixJif5AUW/sVuGHYfnxz+6gIbLmKRkkE6vM265rA9Q2FL6lq7wx18fR3O21ZSCKuejJlwBk9Jw2++r0qmVyaSiiDILnk0uUJRFs6QVW0GVReOSz7d5lJF14ENZaTi20n1JlFi3UkOa/ukOeNVKns8lszIWcAVa5vlU1pbM61V9nx3OWtH+ElMeAbDazcC/UKei/IKmaOfBKBcwmR84dUHQnoLLwGEAb60DEjIuU7LM2uTBlm80IbKo2WLgxk4s4zeNNtIEV1xD0ikQJ0NpWHLMCgYnniUf9Ax9gDqFmtk8GqoYx/wd1FoVcNsAOYg8owa+CA3Yfk8h3OXUcQmNU6pebXO1ldG/W8uBYRZv8A4zOKgvkuftDFtpkUkqTBR65cF+xj7j4VV6SAnHPP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NXTUuGR6neR027q67TKWhXdyFcr5XGk+MQJ9T2o6rsfAaOXicMBJLsVEPN6w0hheSYxKD5yZ3jG+uz95qCIJzQCqXWNF8DNj2Eu6w4gkjxhX6Kh8VfnXkMut7fPWL9JqEqGGHY/6seQn8ERZA3ejfE=</encrypted>]]>
    </text>
  </script>
</dir>