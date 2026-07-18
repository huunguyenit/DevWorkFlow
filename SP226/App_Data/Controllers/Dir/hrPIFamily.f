<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLGridCommandExtension SYSTEM "..\Include\XML\GridCommandExtension.xml">

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "email">
  <!ENTITY CheckValidEmail.MultiEmail "true">
]>

<dir table="hregd" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin gia đình" e="Family Information"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_qh" allowNulls="false">
      <header v="Quan hệ" e="Relationship"></header>
      <items style="AutoComplete" controller="hrRelation" reference="ten_qh%l" key="status ='1'" check="1=1" information="ma_qh$hrdmqhgd.ten_qh%l"/>
    </field>
    <field name="ten_qh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ho_ten" allowNulls="false">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="da_mat" type="Boolean">
      <header v="Đã mất" e="Passed Away"></header>
    </field>

    <field name="nghe_nghiep">
      <header v="Nghề nghiệp" e="Occupation"></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ nơi ở" e="Address"></header>
    </field>
    <field name="dien_thoai_dd">
      <header v="Điện thoại di động" e="Mobile Phone"></header>
    </field>
    <field name="email">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email"></header>
    </field>
    <field name="khan_cap" type="Boolean">
      <header v="Liên hệ khẩn cấp" e="Emergency Contact"></header>
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110101: [ma_qh].Label, [ma_qh], [ten_qh%l], [stt_rec]"/>
      <item value="1100011: [ho_ten].Label, [ho_ten], [stt_rec0], [line_nbr]"/>
      <item value="110: [ngay_sinh].Label, [ngay_sinh]"/>
      <item value="11: [da_mat].Label, [da_mat]"/>

      <item value="11000: [nghe_nghiep].Label, [nghe_nghiep]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000: [dien_thoai_dd].Label, [dien_thoai_dd]"/>
      <item value="11000: [email].Label, [email]"/>
      <item value="11: [khan_cap].Label, [khan_cap]"/>

      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIuBXW2BsZhhmsRg6DMgtIiQIarpEgVqyOc4/QgCGieHvD1l7BCV5/kYKImkRBWrjk36HgWLksRl/Uc8bIafViM=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIuBXW2BsZhhmsRg6DMgtIiQIarpEgVqyOc4/QgCGieHvD1l7BCV5/kYKImkRBWrjk36HgWLksRl/Uc8bIafViM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cs20f1YTitfOijBwa4KVzg//7xrP8G1gR3iRXDyzhG7dSY1HaDtJT+Uo26qgKloVUkSDDvupv2bhoK+8sy99UsXrEmgVjwhWYMrJO3JRWECl+YjwXLNcVdZblkZ8W0jk0iuyOB2rtQWPZnW7Bm2znXCVvbv8eJ1lpcP6va5IS39Mhhf0isCilXHNY3QhQJaFCN5FTTv9AenNXFxjYIzs4s5c8o5Fh/hKyeuv+L6IeubY=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcD9d8iXolkoFL7ZqjVF4CnKLbH1W5VecwY3BZXHe4ZkQvbrEgnVYhVFVmiVyHsCYWg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1kKnbVoNF2njbwUgFKK4xvn9Tr+qKlhEHRupZB3hDnHQ1TS8YpdN+3Zf5hsqW/SAA==</Encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        &CheckValidEmailCommandChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>&CheckValidEmailFunction;</text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7J6iW+rNza+5w/hJUSp7FwSCpQubG0pWVg9rCq/Kjn4c7hGop1GYU+LktFzdhYbRA==</Encrypted>]]>
    </text>
  </css>
</dir>