<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdccongbp" code="stt_rec, ma_bp, ngay_hl" order="stt_rec, ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh bộ phận tính công cho nhân viên" e="Cost Center Definition"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY1hhyR1cCxbTpYE36KRQ1AOQlA0h5WGczBnwyQ6Ay2g42XliZCJDExQhDwmFOhHATp59jXzZlrRuTdzClpG0t8=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 220, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110---: [ngay_hl].Label, [ngay_hl]"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvpHe02QM4mgcfjw9uf5pyB03020H7tsXLcvoEeYHjpmlC8W/XRrOBnLJ/qdQiRW48vfIsCmBnq6zi/D1PhfDl3v</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+AUuhaXa5OzoDCGtBAwQvpHe02QM4mgcfjw9uf5pyB03020H7tsXLcvoEeYHjpmlC8W/XRrOBnLJ/qdQiRW48vfIsCmBnq6zi/D1PhfDl3v</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPONa15vQBIE07uGoJ7EjTR6lHxEjzhNkmV2qKCF3w4K/RO6wkW5E4+OULK+cO3vdpZMDhwAyCwUG/gUsZgbjse7Z</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RjqY9Kd3C9EAQHcfvIxi7P9PSHDcBjuj0wfmfi5IoaI8pXJbd8I7BR24+TFGXumkElNG0m+8x96H1H15nkg8yws/5+pz2fpB5jIdtqKDsmDaY8jneB97+aMeAT/+dxNxoSj8KeDcz3h4TlPnJKr7NyzJu/T6PXwp49k3kkd+tUkuHCrLjG/TNUqCOL6alyFAQ==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbRptsr13iekuFddlJY0mM2fK+oF3iRl1qC+7kUXOWfRbMJJ3FfD2ehqzYE9ZPEHqtT4egQxozPtwZaSfKXhQI1V2RZvYfBfvscd+Tt+dJpbYRNtvxhgrW22/5eLJN0SgqiYYOcTAHZN5PfdLWCze58wCa5RNvI/NobG6CpoV4AwRKS4IO7x6wmRSN1UbxP5jqNrgnJugBsMkgBJwNqOgKPDT4Qu/vEH2sb9TVw7GJeRR0a69zIf+t7MIxKU2BDJKwAw/AvlCEU+fmjPqcTZwlxN</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q2/JGHS8O0E9S7YmkoHtGDaBAHe/dyxiDKKzVP2laV3M7xFRgII+xF+oRQPDUL6tu6hGRRenPw/eYdS3nPZ4Z/+iZBO93bwpi1VGj2D5SsZF8XCFhwe3iNIWnvRlj7x+I7muwqQK5oE79TyAasjprDwAXEJVIOq2vEzK0kRa8oCM50p/VX58Kx5wD5m2o2rMikg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfw2OUFZLCErydeSdWm5ijzlfJtWi/+EG1bhZKIjn/0KojZY66C5CA59fVnfn/L0z06goi1z3xM6AC8MDFvkxKPhKx/rHy1d9fvVNq1q1H9XQPxKTUn57KCIx62kOR343xRNGkWuG8kMqPuPX7EacrcF0eAfXKm6EuhLRY7pBoFgp70FGKIsyYuFEm0xR4VTUg/fzBYe3ozCl5qrAt1vQm2Kyd16PHQnz3zJ5YamQ2hAU2TEVONKx9tKPjhgOK0pacg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ojnt1vEtkFoAawCps5/kRZYT/q+HnU4PTgf+044eyftt8f3c2ASqgqmJhg71PExnZKZLs6HbUHRkAM5bVswBgNnvC1LLOhVniqIJdQsWmuuipcwzAFjHQChtAbW2fkD3xdNo6TK2U4F+geTs+seV82g2KoKhwG+Y+16AChsqjRRXQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GCYx7S/VJHxGKXDPD7ojwIJhePXkEic7HjC/ZGusIXhC9xf3Wq8YLCx4bqQ+xo2MHrPr1BifH2DR78LRw5LYwf7Vikp8/YaxwBwaU1G9Xs7qpMfoJf74FienYwu8lP7fjvGp+6AS8wrvse/3GCB3jX0tQbKR5KSmp//JgsZCwRJjJE/+wh707A9wm0oIaHu1MnAOIyZhgmghyeHmXFkPIWmVn8w6Wz7tbOt3oc9xEcfyFcZ6kcNjrPHPW9SOsWeo40dscH6mPOnjzmenpi6Kuw9H71CJS7BhGi0T5PHge91sA4/+NreElLZn5OQdfgXXYEZIQ2G+eEZ8p7sa53ILQTVdbSlgvBUuvGFntANW9k3OpQ1SpDCNWlaNaDR1iZcAM02KfWq+Y17TePzINncJaPPkOnNUaSh7DZFedYgjYeXIXheZ+MKpO7U3ipk7Zra6A==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>