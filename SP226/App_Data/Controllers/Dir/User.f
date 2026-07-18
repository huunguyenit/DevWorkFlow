<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY l "8">
  
  <!ENTITY Key "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+4nXz3lbr6yDZIawc/Xso7QAolUhQGyivITZWwuEFlxX1q2Xj5u/Dmfsldf1fcNmtdx3EdvvV3TdkVienM2Btwi40T3hNzDcNAEjMKy7E2CP2Kpj8Pob6I9/Fgrl0N3eB7GOtOLPhbRTaggDqZXddR4UilZQKz4vWEMVwwo89hFOuC0yyGvLyffYWANPnXz58A==FastBusiness.Encryption.End">

  <!ENTITY Check "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dytE0u2fmcIpALvzcIClGg8/di2s3S2h1JCx0WETmhqm9dMsoEWLiHggODUPTIL+t6vIYabDMXlX+VpEpYBjSG9E7yjWEYKhwAi+++Id1bOMYAbADO8Q8svUze3Hd9o4VeCxl8TqvdZPMu91zJloIct5ucpxtxsECMfjoq2hJHhlw2EOG42FGYT7SpD1+gsjqtvbEXEzPAo1+Df4I+XBPZSmSJPTT77v6uxewz9eCKkdZa0ehBcv9Sbs0XGKxhhX1Dq4hYVRrX9WA4RGhRYFPy/FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8lCaiqKRBD5C3p+h65lvYj88RwrTvoyQatmwsGbNvKbdPsRg/EgxW4vmklwHRVAfYQ==FastBusiness.Encryption.End">
  

  <!ENTITY % Profile SYSTEM "..\Include\Profile.ent">
  %Profile;

  <!ENTITY % Chat SYSTEM "..\Include\Chat.ent">
  %Chat;

  <!ENTITY % CheckValidEmail SYSTEM "..\Include\CheckValidEmail.ent">
  %CheckValidEmail;
  <!ENTITY CheckValidEmail.FieldName "e_mail">
  <!ENTITY CheckValidEmail.MultiEmail "false">

  <!ENTITY % Device SYSTEM "..\Include\Device.ent">
  %Device;
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin người sử dụng" e="User's Information"></title>
  <fields>
    <field name="name" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Tên" e="Name"></header>
      <items style="Mask"></items>
    </field>
    <field name="comment">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="view_pass" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="view_pass2" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Nhắc lại mật khẩu" e="Retype Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>

    <field name="pwd_type" type="Byte" clientDefault="Default" categoryIndex="1">
      <header v="Ràng buộc" e="Password Level"></header>
      <items style="DropDownList">
        <item value="2">
          <text v="Tối thiểu &l; ký tự" e="At Least &l; Characters"/>
        </item>
        <item value="3">
          <text v="Bao gồm số và chữ" e="Consisting of Numbers and Letters"/>
        </item>
        <item value="4">
          <text v="Có tối thiểu một chữ hoa" e="At Least 1 Upper-case Letter"/>
        </item>
        <item value="5">
          <text v="Có ký tự khác ngoài số và chữ" e="Consisting of Other Characters Except Numbers and Letters"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="pwd_daychange" type="Decimal" dataFormatString="#00" clientDefault="Default" categoryIndex="1">
      <header v="Số ngày đổi mật khẩu" e="Password Expire Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="pwd_nextlogin_yn" type="Boolean" align="left" clientDefault="Default" categoryIndex="1">
      <header v="Phải đổi mật khẩu lần tới" e="Required to Change Password Next Time"></header>
    </field>
    <field name="pwd_useold_yn" type="Boolean" align="left" clientDefault="Default" categoryIndex="1">
      <header v="Cho phép trùng mật khẩu cũ" e="Allow Reusing Old Password"></header>
    </field>

    <field name="restrict_yn" type="Boolean" align="left" defaultValue="0" categoryIndex="1">
      <header v="Được phép phân quyền cho cấp dưới" e="Enable to Assign Right for Junior Users"></header>
    </field>
    <field name="restrict_users" categoryIndex="1">
      <header v="Nhân viên cấp dưới" e="List of Junior User"></header>
      <items style="Lookup" controller="UserGroup" reference="ten%l" key="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and name &lt;&gt; '{$%c[name]}' and dbo.ff_ExactInlist((case when '{$%c[name]}' = '' then '''' else '{$%c[name]}' end),restrict_users) &lt;&gt; 1 and status = '1'" check="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and dbo.ff_ExactInlist('{$%c[name]}',restrict_users) &lt;&gt; 1" information="name$userinfo.comment%l"/>
    </field>
    <field name="ten%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="dien_thoai" categoryIndex="9">
      <header v="Điện thoại di động" e="Mobile Phone Number"></header>
    </field>
    <field name="e_mail" categoryIndex="9">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email Address"></header>
    </field>
    <field name="d_language" categoryIndex="9">
      <header v="Ngôn ngữ ngầm định" e="Default Language"></header>
      <items style="DropDownList">
        <item value="v">
          <text v="Tiếng Việt" e="Vietnamese"/>
        </item>
        <item value="e">
          <text v="Tiếng Anh" e="English"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="alz_yn" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="9">
      <header v="Phân tích dữ liệu" e="Data Analysis"></header>
      <footer v="1 - Sử dụng, 0 - Không" e="1 - Use, 0 - None"></footer>
      <items style="Mask"/>
    </field>

    &DeviceUserFields;

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="user_yn" type="Decimal" hidden="true" readOnly="true" clientDefault="1">
      <items style="Numeric"></items>
    </field>

    <field name="id" type="Decimal" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="admin" type="Int16" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="pass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="chkpass" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="chkdup" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="pwd_update_yn" type="Int16" external="true" hidden="true" readOnly="true" defaultValue="1" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &ProfileField;

    <field name="nickname" categoryIndex="9">
      <header v="Biệt danh" e="Nickname"></header>
    </field>
    <field name="chat_ns_yn" type="Boolean" align="left" clientDefault="Default" categoryIndex="9">
      <header v="Phát âm thanh khi có tin nhắn mới" e="Play sound when new message arrives"></header>
    </field>

  </fields>

  <views>
    <view id="Dir" height="&DeviceUserHeight;">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>

      <item value="1100011: [name].Label, [name], [id], [user_yn]"/>
      <item value="110001: [comment].Label, [comment], [admin]"/>
      <item value="11000: [cpass].Label, [cpass]"/>

      <item value="11000: [view_pass].Label, [view_pass]"/>
      <item value="1100011: [view_pass2].Label, [view_pass2], [pass], [chkpass]"/>
      <item value="1100001: [pwd_type].Label, [pwd_type], [chkdup]"/>

      &DeviceUserView;

      <item value="110: [pwd_daychange].Label, [pwd_daychange]"/>
      <item value="-11000: [pwd_nextlogin_yn], [pwd_nextlogin_yn].Label"/>

      <item value="-11000: [pwd_useold_yn], [pwd_useold_yn].Label"/>
      <item value="-11000: [restrict_yn], [restrict_yn].Label"/>
      <item value="1100001: [restrict_users].Label, [restrict_users], [pwd_update_yn]"/>

      &ProfileView;

      <item value="11000: [dien_thoai].Label, [dien_thoai]"/>
      <item value="11000: [e_mail].Label, [e_mail]"/>
      <item value="11000: [nickname].Label, [nickname]"/>
      <item value="110000: [d_language].Label, [d_language]"/>
      <item value="111000: [alz_yn].Label, [alz_yn], [alz_yn].Description"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      &ProfileViewPost;
      <item value="-11000: [chat_ns_yn], [chat_ns_yn].Label"/>

      <categories>
        <category index="1" columns="120, 25, 5, 70, 100, 100, 130">
          <header v="Thông tin chính" e="General"/>
        </category>

        &ProfileCategory;

        <category index="9" columns="120, 25, 5, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyK4ivZCl09+Paqk57QmnneGNvzwFL5/ktYlIz4YOjFoHtfa6yuef1eaEInsbVCXiAMQ7/uV341/oRGLth38MNTmtHVoQKp4IgrsBp3lX+F4ctFCbIUNQUQHiXV8SzplwvX7mSof530mP9XxRVNCpIC53oUC9MBFIzhtJgPDJzAA</Encrypted>]]>&ProfileShowing;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcITQTlB7Ovu7R8DcSsYDMQE=</Encrypted>]]>&ChatFlag;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHonNR074CSQxQZQegQIRjCIuH/P7y6fC3eyEWSUT0aeMkcPgJHQBHJ/YIAHiksRgtQrA10XY0THgt9USRCrz6welIxTCm8hKw11CEJxrbZDezJyt3nFqTFuaxPm5Yn/qIUqVp4knBp56V0/+5YytmNc=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8R0yFLk3fPtqhNyCOdkq9x/OC5yofHePc5KtYPXoo3ZZl3TnfJDnDTs8ejbjCXO/TcXOVK7jJHC1ArZuSb2pzG4xpW0fk6tnKGn+yOOy764JX8s3+oykETtXHSeLTutWbhYkcuhOzT27nbQl6Xm/v3iT+/D0UVlnn93uOycimZmAfVmclgm3w6nuZ5b7v+FKAC2I9VWqI5z9IPVTTwreBpBCj/1c+w0gxkd60h6aRpMxGu5wO3G+P3EMOlmAfI1kILPiUTTozhUcMSkiH17WL4qrAo+Ucfzvcv4fbJ/TTbXQNZGt/KEV88sD+ZaT9jdfQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBuS9Ne9fT2FQVO1ZC1myt+dHxAErYLllnTHgobycJrsJCmVPjHJnIglsA/+AlUsrw==</Encrypted>]]>&ProfileScattering;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ1z/ThtRrQvtD50PZb3Ml73IJbgoKvHjAm8DFcU0JDe+</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbjfH7N8sW04qpfcmVOQ1xN6q0e6wlDViPYU/D6lnT/iXVF5FSK8BawGLKDdzATrvEPTIgUaxcd968nilPxRJhleZFsWmsOaJYylxMDjPz9b5VO6f97HcPGF8V2SBdXyDz96MIV1GMa8ZH5ptcWo/oidwgAz7u3kVroU7u8HNjc57cxRSOtlYeDJSFB2yARdzxTG/gv1ynfBUgKT1C0ZEFOOfBsq0qvzvmVLBVNVfVG3CzslpuM9+1VEXH45SO5fgIwi8UcCQvqXLc6iCgfumkae2Pxsx3d42AtlWN/6haWKKBwCf6DjB9jqYeVv3TKL4djc18/TVzIvAw36NWNBYIyOdqpXKCAV2ONuZx1q68+Y9abXHM6k65mIdBUQWyU/0bvDxUiW6b3BtqcLFT1sLY8MnYid6X+uLRpbanC0f5QEx/tsJx2Z8fNIS6WJD9xSjbMW+JuC4202JeM//3IzUZAdczdLA0wsLxLOd0HuOb5JJpCXKBU0dsD6XX4IINMSdnw2SokjsKEGK6gksGs7grNCQqgJTuycpFhnLsZ0i6vlz/v4/Us81iC39R56C4rAoh4ATiJNUXA8YXPDhbxmgQcqqZ/ZIdeTV3VGOnAdnk1StvEfX4ZurV6X5ZWsKNQySkloWNArl41SMI80/dHQVSrtNHU+5v+Uo6CvK8Bb4HQsr6r9GfMbUoh9dnoBnuihuVJYvoOx8dYDLgkwMmmOkKS/N7DgMztkK5xA9aHKFBQG4lHL1gpKq0rT8RbvjO7k9u</Encrypted>]]>&ProfileDeclareVar;
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &ProfileInitExternalFields;
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1Zdaz/jBdz6LJkwupzckZGF0fmJq8sYwvLU1+lPUNs9kAoC/7LhVaYE7hoDqpaYh4xaCky3SkPMBzZsdwfShdDdY9h5bh8uUFJpJ83U6mMHHAVFdqwlkp1kMYswbF5tlPH7T9ZhLJLdKvL9e75OzAUu1rayFI6ZQGKX/aeSwocwfGMRfOeL5cudJNaU0AJ4FI06</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4e3TExr/haGoztmtDq9e+Djj4d/Rsqc7VFXX1E9lZ78Br6VqhBRtVIw/GHyBgRXVRrzXSvHIn83rH1lrYdQzTRwk4qL0ifpW8M+sUPMel1J+ItgFnVsyLthwmeNiAsvdZyAwx9knYsrq8ixdmYS1PU2ZVmvYpIxj8yFZIIhH5MYK3cAZrWEnYHZ8ZPJWDF4PvQ==</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VWxGA8s3FfS4mRQJfI8Ww6MF0j8uJtBs0Q1YomCHJRgU6cQzvxObOGD1+ijIJ0Dlr5IEG3LCVYAOUi37nNM02TiMDhHmTydOjla01Hs/iiqX3pVb/sO0XHnEejc5KUXZ2+NmCs8laQDW2hthI4iSGh7nNSgY511wmhAn5XNcIDlkv1ZZ4pvYlAlCmCCVuB+mg==</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VWxGA8s3FfS4mRQJfI8Ww6MF0j8uJtBs0Q1YomCHJRgU6cQzvxObOGD1+ijIJ0Dlr5IEG3LCVYAOUi37nNM02TiMDhHmTydOjla01Hs/iiqeB8gOkAG7z+3fk5FZ7NAC82JOt8fCbBqdhQQY/QebyVgPs22ZGwQfNQrol9pOeFd1GfqGHGWpXJ4KtRkuavoVIzFirgaWEZlzDv6OlKYCus=</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TnsQCkoDqeSdv7FHzVd4YXBzSQplu3uDb+Gy0prBe707onJq+XOkmzh3XYs9ecmyiR4W2X3TrZuMiaVi6C9poHYMUt+TWJNX1KlKy/7PJGfpN36JBrGDpbsmXFhmxuy8Of53ZmNf+k7G/NIqINWRv4=</Encrypted>]]>&Check;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5e1Tj0G43ikqFE4BkJbbaE8=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&3fWeGq8RzWh/NTe1zazZNqh39Rhq5A8noB3Rg5IsUB86bDf/NkR+pRWCLnL/Kd+rJYKMxnfJ44aun67l2OfbbijsWyTj63k8jDVUDXiINMT/0b4NkcNR4S/nLSAr34YZ5ikwwCuiU7zQgQ4XMwwuC4nIQ7hxv6ydjMYjs/mvsN9ZpabjAPl85GzYnQP/csPVqOllSPCMMaAJecoohM11D2dP3O5crErKIJOofJoTfEY/n6tCRoP3phW6clgNASG0b3MaUelr3VdHch9Hbk4RagstzXhfl8grB5P+tpLV+BI494fCyE2BxNcSSNs2PqmUqXgxO4R+DomZmBHQPdF/mQ==</Encrypted>]]>&DeviceUserInserted;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNGw43+/Ml6RgL1ghJzlF7SCrS4AAP21YlLT+ryOE41UIBhkMJyg5G59tV4GAtwXQJGwXSJQinQml1HxW7BEAnrXQ+lKzxceEtxk/LUf1IuHA42GjtJ00sNid4/MMTKkQYHMOYrdwEsRTcC67RzQOG2GuSEdXlD9NPzmDEInUrWaC</Encrypted>]]>&ProfileInserted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOjfwyeCHXGtaAYVSKW/QtDEn44+b5cZIjOOvW/fWj/cqVT7/tmr5t9VjmHRq1unpRY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Check;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXuKtwE6ZgwbY1KCRe9atqzaEJQOyAsCVpL+wi6wEp6KulKdz7tUrT3EU3phMFSbKg+z14NIFJKtQjakp6XQqKJgc5crqwC8VCRvsk7v56tr2QWsqU/mY0nALn5E/Hl+XepqF3HjsOrZC6YlpCjLFGFSjjosqoS9N/ic/Rv9q9WdOuWULDnKjhhZCAsGJfdXznl2QY+8oyAWoW+xp6zuZmJ5agqitGnXSUAU504BlbPjfJKKM07zKhP5zCs9u4ssBqDdgR00ZK/9Q3pFAoFPcsvHSYQ20ouLlXgQ08l8s0RO1h0+UrxhLmUK0MCcA8EjOcmo79ZjkNzUTW0U2KjBBcaJv9dJNFtzZda8ClLzb0JiMuS9o4JXL7VGKi/VMlP707ZXi5tFx3dg6PhcXpmAhss</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4e3TExr/haGoztmtDq9e+Djj4d/Rsqc7VFXX1E9lZ78Br6VqhBRtVIw/GHyBgRXVRrzXSvHIn83rH1lrYdQzTRwk4qL0ifpW8M+sUPMel1J+tr1ScQ7XXJ0tbDoB2IhoRRec9VzuLFRX3bdqSPVQs4ZEj8wM+g+n0oykHI1VFtDiMcNduD7+LAlFGadN2MACf6wgLUkeswZYFU6TUCda0IV2HSUeqknbmcOZPwT8xThh+NGwW1necaADir/nSEqxYQvGMOsNZka5MhNOx74dxWQXTJMEjKX0Gy2U3T6gAITMQGaJ4w2OGdFrQaIjMBzBh5I1FymRWJ2mTVbszpKppg2oU5zG6xaFmVhNSavGiKMp</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eDkvhld9eeX1otYzLjGnDatu++KeHEt1BuEO55SyuKLsjZYcMEaj7BOh03pUZcvurgAYeFAYbn2UqdqVr3+HwHhW4+qlJIjUg87ezWxUKzgeeGbSADyad1k2CFkFeM4hekZmvQqEpfEPyo9I+q8ASs=</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UY4fce/Iw5PTTKuDMAS6wxfRQlYk/K06SfWnSsHcnaKY0s6w1UqA8f36AfkMz5r9BLVybtMxfHutkk5y52rl/wrElVpOYZcyb+x9kAlCFOh93vhNfNJt4QF1MOGErcy6+IRhl73xeZCYON4+RwzyKePKf3L1L7i3aNXa6l8fo9Rcn3M/FtM9y5Rjq0rBimt1Ff7an4FpxGvKA1ENWNHmY9g9L1++M5vno1B6rHSEZlZ</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VWxGA8s3FfS4mRQJfI8Ww4QOK3IRhlPz+yB7l0V+/JQ100hSdZvn+H3SwTUyY33FPAWwuPbbHYyv4kJUMosHaM2CSUo7L6WzN1kF6H7JLw4LjYJ44ASUvY9LUSHf/8nrtMGUWfuY4YUqMzCaRpNQ0o9qsBCFIQpc9U3fjeEDWdF2pnR+Az9ePPqJMFjVF1mdHJORs0G+gixSqsYs7YFZ+8BC8k8PAgzER0ySN8u8z3A</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WG1Crc8FwGTP+dKKGPkre09NpwFVH+Kh4t1/NzPVWiLE5D/JCOjBNcocZIPvLQKmwHqvguw8iEePsOeVrLgLczZnwxNvsCsuwZ5cj0iWn2GvN2+J0dDHhnh6eCb4E1Om9oVCpTZQdn00nm7SPmYyi2psJlF1qcziJHmWf/+wKJiqlq3uE2JdFgb0kLyEomYGg==</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WG1Crc8FwGTP+dKKGPkre09NpwFVH+Kh4t1/NzPVWiLE5D/JCOjBNcocZIPvLQKmwHqvguw8iEePsOeVrLgLczZnwxNvsCsuwZ5cj0iWn2GMvOs06OvQPt7InSEuAeQd7FnEjhftdHNWpjNeddcyUuutEG0BwomACQZGihEwbssRmu2lcTmNOkfZVVl5oNqHDkbhRj47UUDSueiCF9tTRI=</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VWxGA8s3FfS4mRQJfI8Ww4QOK3IRhlPz+yB7l0V+/JQ100hSdZvn+H3SwTUyY33FPAWwuPbbHYyv4kJUMosHaM2CSUo7L6WzN1kF6H7JLw4LHHvXAfAB6PQb3GDT6WG+DFPVtm6kxQh1xsEdygsf6N8tq/OZSRl4dlVkfb1Nh/t+xSqXH4H6Ndesls/Qu7lpWVcudJY3PGcyx5kEAxWRiFaOn9lQOwFQ+2tHWaEBFZYv1aTZhnA5Ij9+eE2X0y2lg==</Encrypted>]]>&ProfileCreateTicketWhenReturn;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TnsQCkoDqeSdv7FHzVd4YXBzSQplu3uDb+Gy0prBe707onJq+XOkmzh3XYs9ecmyiR4W2X3TrZuMiaVi6C9poHYMUt+TWJNX1KlKy/7PJGfpN36JBrGDpbsmXFhmxuy8Of53ZmNf+k7G/NIqINWRv4=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys19ftRjwKNwqqUw4XCIL6+kSOvgldYpZlnTanBzvSxYO4pQBk60Aur9UyPk3vt4IDU6ub/NDND/by7YF9ScI+M4QnuvpF/+/6XwU/z50cli3DDnvw5LkZXtBLD3EO2vcRCRn4PTD6clvKezf3GjGY6GFDMcGtMLnCfKiapJRmyBLdM=</Encrypted>]]>&ProfileInserted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJLEsGD+xkewGJbDiQEecCWqR/NppFo6znYWCtPpbzxnYB34S2wLjfWztA43YggmmcWgn/ghKdcgH1b6XjjA2xySc65sUgWQ3H/hboPaBkTmKrOfrozjzESllXDKt0tbTN9X2ykeSRNnUzudtxzI0Xiehjcu8lEnkXbs9hGJDccbHuxww2ZB+EeKWou7yxIDtH/aLeAG4pj52XpBjBgWbe32Zcv/JyX27gF5R831wRzp/J+7suo3LUvUmeTT2veMYGHCHOklAUkNFzsqWiMf95k=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdJd1UmIN8sYRSFEPm5Y2tTLoikjtmqwUyDw9iKtadc433eDLLD1r4bluijgjjJTK5E7jxvzkO9YyDQcuCKc/3ezzCShDG1fBoE4YClCHFZF4sXaD0rNOgQBKrWS1yj05YCxvQpQ25R6cr+zpXfvikXC3wGHkZ/wtFdeaN4+kvtWs=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2J8ruzxzl0kf+Y7zeEzPU7gP5Ei+fhABiPkR8JsxCcjBDoqSrqcKACpEweF1hiv1U4Q7F/3N882TbVCGSJu6vCwNY0CMPMgHMdrXNDNjPMeC0uYHIA5PKa0s0W9Ul5tSbvR/1GMPU1CBCiIP0bbvj/obWBmVFGQdiruCitDrMhb1mnItn3ilqdNL42+02fV/z5rJB10PszwgmV0jLGVIT8=</Encrypted>]]>&ProfileDeleted;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dG4f/ips+xdbnDm2bcJMsBqg9sG+7iwDkuPOYqCQcRbURPBdY3IPOvGdytJmoL0Jqgcpgs3EiaS7s0c6GamhGkbAVpXKzU79+QM6CQiKZG+MBW7Irm/DQyTFKWi6nptiNdsuxJZHUc0f6t3r+BMla7f1JtLsF7xrdYG5XVG93sU2KHHg1zJek0BIot3juStUJPen3fRP6xqUD/KNL56jqqgcVCJyCjhlxl/kKnaTy0nUD7knZcydB18ri0gFq8brb0aXVHZNMHJo01SUKxPeTQUhlUVurBaGA1CroJSmmVhKYqs4hF1IxBcpKAZ2p7vx3//rzdKxN4PIvVG0Xlh411JK/FvUfz4oxVJmaYpsUOY</Encrypted>]]>&l;<![CDATA[<Encrypted>&55f8j3HoHKPzTktykj6wRdISS41UPCb+y3rshKZHLDHUZifyZGlqfdg+UotOOqMuSX08qlznbfNYebI3il5asT4Jk5Shcc9vIIWm99Uuq6w=</Encrypted>]]>&l;<![CDATA[<Encrypted>&epK3OtolfTsOm+l2eSx15+S4h53IFuNLmDzozO3wmQUoECyfbIX07YYYgWeLmFnYENTYorjqlYcNSHFlrKjGJtpWjFOiuJvAwNX3qEeX1+Jtmbzu9wINWwQE8Z+DE9t3</Encrypted>]]>&l;<![CDATA[<Encrypted>&55f8j3HoHKPzTktykj6wRfG7omuLwWSz0F08hcJab/MamK+BR49IfcNP4js16FrgpJnG+lxm97wcS96ZEW5bLoro+dLybIKVf8P6M276wK5Qvth2SX1UrODNBbkcFs1dFGLwHWfp58QeYkwfbdcXPg==</Encrypted>]]>&l;<![CDATA[<Encrypted>&epK3OtolfTsOm+l2eSx15/iN2I7VbE2WnHjJlnzG8ifql7yOUWsucD+8KFC3fA/A6DOFjaH2pCBOoGTBz7me27oTENKXfEyXVZdTLHfGUsjSEX6/cKaetfNZZduw4YQgonoeR8qRHS5J0j7K8SFxqA==</Encrypted>]]>&l;<![CDATA[<Encrypted>&55f8j3HoHKPzTktykj6wRfG7omuLwWSz0F08hcJab/MamK+BR49IfcNP4js16FrgxyFX4jzZg9weh7PSm+UKHjlfgSgl638/IVw0nFuKp33pMiDs2TWDWYd/wXVndyNKgiQg84+HxpmBBCrqu0Q+PQ==</Encrypted>]]>&l;<![CDATA[<Encrypted>&epK3OtolfTsOm+l2eSx15/iN2I7VbE2WnHjJlnzG8iecN5PPWKWVilumkkA/AW+cZE7NPtC2umkSLYenat9ny5A3H5Jd4nL1uBPEmryHLSZjHp4MHHv8AIEHAOIJah7V7rFDjoqI2Kmr6xmv5bHXIBmyKrOCdSczdI67fvfkBlc=</Encrypted>]]>&l;<![CDATA[<Encrypted>&55f8j3HoHKPzTktykj6wRfG7omuLwWSz0F08hcJab/MamK+BR49IfcNP4js16FrgxyFX4jzZg9weh7PSm+UKHqGS6fYJ3dkIlZAbFJlct54ripZjIdHuueLtMrlx6IdPdwbhPlv2hM7fi29amGd+buEBwf/k0vf0MQLfdHcbl6xvIjJONjvADkDMIAUtaSCC</Encrypted>]]>&l;<![CDATA[<Encrypted>&epK3OtolfTsOm+l2eSx15/iN2I7VbE2WnHjJlnzG8iecN5PPWKWVilumkkA/AW+cU0Y5XA8SJrTwTjsSIGbsTVyI0AxsVTeKvtvsoaeiAuzSY7C0XyONdCvODM5qRqlkJzoyhxpyffOhXEJziVqo6Y5GmpcJp53PIZJpV9VWbVzZrgnISrqy1Mkv18QKyo36NWYTTIQzdhqs+l4QMuS+NN8w9X8J6WlahZEbj61Q28Ca9yHTXgt2q2FN9VAtbRRQuGcjlZX1t9W4VMYsDodp5vE59K1IxVh+a+2AIN+tx3SH9jXI2m+8+LjgkCBPlIxe0nd55ZnK/zrMlWL/Pr9bjKIzSlyJI2NL+OTBlZyeLVB6EC+VKQcbgvxGOeUTxb+1ZhudBGfgwE18UPjVbKjLlw2MDHAt9mcik34PrKTf169FRm7TSzPtTL2Elnz4nvXAPDohTXzE7fuN4VVS3mcvAbMOnqbHav1gTJJi8mlriiejAH971SYcBTyM0PFaTguiGUMgoeKADXd1MMkLGl27PV5MFr/5fR+hbcwX6uNbKvBtzNORJNnShkqn/WfdvXpTwG7Cx32EuPyI+opOaeFO2CJoCH/EqH/dlrjmYPrA3MSCI172hzZTEiuQE4vzg5JuWiOsQfCsTai6mYbpm7jeJxJhuqbwtKq3dNyWHSQI5SzPOgOXpSKf2h5BdDiX2F7vIsY7E8E21AsO7tmyqvHMPh5ivHo0bGhJe9TYqJg6SSzQJfY8s8cxElqrMs8nTZJG42TEvlgPJlrco+r3rBQRbQYAZypeME/so+3WTEOtDxrtVuzgPujFLlxZUNhpuGiNy7Q34unrhFxGfhrR/bgeuUhhJPajYLwhm0xqEAw8tzRp6w2pUOnplcN2iz/7HWcAxnLOKmv8RqzPJapgHqg562sf2QzAI1oXHPoBxQv401KS2GGGTswZbT47nHoFIne3Gt7RemYuxb/OAuIqrLXfvAaSb/DCiesJFzoXVjK+Mbo27l3oVNQY/87fpBRuT8JxxdU51P/mA6qJmoLRu4g2cQhsJdm470LdbUKY+3HjRiKBCTFZxEfJO/cbYUWIz7l5Iri5QkBYUzeP1A3XEjQFSg==</Encrypted>]]>&l;<![CDATA[<Encrypted>&dRY5Q2ne/T2Opt89Azei35BdjQbJQiOlFCaf+1hkg9qjWh18SnhyiG7YHx0Gb17R0CrAu9pHkob5oBHbRcj91dQ/uKpk2EsZx0BwtSNeFy+za25DtviGNra5I+9WtEUx21AR4jKfFWWuFt5vFEYKJg==</Encrypted>]]>&l;<![CDATA[<Encrypted>&zwXOQ3hOXQRMNs1bpOCrK9n8NxhbrOnivfOwv0f+8zIIL5rsBH9NFqyFaJCrsB7uwWOy+uF9jhPm+60uDr8uL9y9gfHKnbnEbrZpqktn+ZfNRijBhVm6u/Z5vx6dP7fnmHpne2vb3kVWcvGYfblMrTdNQ1BKEuSiC1jDWg+s6N4=</Encrypted>]]>&l;<![CDATA[<Encrypted>&zwXOQ3hOXQRMNs1bpOCrK9n8NxhbrOnivfOwv0f+8zJfV29fujzMMO9bkI7PlEF0my1zpQDmePeIaT/09U9xn/9gpfQKnheoWjjCJp0tx28X5wyOOw5kxsU77zUT4wREIPt5UA96dJ/9MdTfWGGr8b2+a+Iq/Wz5yM4gPGBN0ts=</Encrypted>]]>&l;<![CDATA[<Encrypted>&zwXOQ3hOXQRMNs1bpOCrK9n8NxhbrOnivfOwv0f+8zJIr56PfEXgUj+z33KrzCP4jnzJEv0DgdFtbrLi93TbbjFuzuCvC02f4yR7Rrk51iDzy87qKebn/ZMAexSQryeBbsc9H0ST9rX2hUcUcDfCO8BvbDdOxgt7zhWz2wUboTljanlfxAprrQH73/K4C01n0IaGM957qIGgNCThZVOT3VgurkHd4LvSQhyoI/fgM6oW4+jKtOWt3PnzUshnYVtC9uGq2+hZx7PT43ASYoVIRR/gNIqaUdsZJixqvtbKg1NGHYQwdC0n6Qj6V5zvAXTcVGQq5XEy6Y6Pl3h3E662F26i7VfuMRidnMDpYqZC4O20j5er5BPBwbeiG9UaPoixEW2PVPPxiEDNTcOjaaEoyg==</Encrypted>]]>&ProfileScriptChecking;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
        &CheckValidEmailCommandChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteQX8aWWai6GJEKhurLCFVf57jkLYrO/+ja1nY2LqyiIVje7/cspeLRafN7Ep6DhGr19im/f2xX4at98zxXAmjI=</Encrypted>]]>&ProfileFixCss;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eHL2VwV7HAI/OWL+MpufFEFP5AUZ8ip5lManuKGZOF40vKnoIJuXywzBzN8agWmQK7ZLHjK0HVtKXfV7frc8/DTsdb7BmRLVF5zf+5BLCwp33uNPYWLP9ukLN5N5Lh09b1OVVLUch6rUgBGeeyez06j+pGeyNheotxyjBbYFm2WqV9vm9KUNmG2QaYCLXXo2h4GCTWycseL/Wt4BwjcdC9+SIgzuBZPDtmbnltQP0v0hBKOp3NJJBHQE0Q6zDzxsGS4VYjVkRZnitIM6KzrqXM=</Encrypted>]]>&ProfileScriptLoad;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bOCE/SKY9xObBWgLovPshLiLebX62E28CF002soo6cRheTzRysvkHMEL0Cd/Y/JaUzgkIBynikM+BmwQVhd/Tz9wxL+o/Yjo6CyiUw8IkBupLVtweoRXH03/w95vyxqKInVhVl4JAWpvfkXthZzhMtDmb3ttQtvzaUbituWI8hkLZLqf+oI+yckgGyqIGExo/WeVl0ea4Tl17Wutnd/LejiKU3hDn22ksk18W978IMXxA/hd1076JX8PWjpGBdrNZQLLNEW1Yn9ahxdnEhu7ym/F6lO3S/T9bGLjntcARB9Evnc/ZutywZraC9c5WevLIwit5nm5j8mzF67wjE9frfF5M43mZdgJQzZJ+M1NZICPQDJdJy2qISN8uGvawyY3qn30IJ3UzYINHhmjSZAGTzI5TQ9TDjCw0pBzKGYt2GOuQk6QpHU+WXkC0yizpg3kufPkOMay1gXdxLDTdcyZLA=</Encrypted>]]>&ProfileScriptClose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X1VX1EN+NC2L9FWc3jmsqXLptCVztT5teHt3Ey+VLaB+eKel3VwKKhIJjOv27p/kIs30EnhLhX6MwINqDBsPsBMN3nwoth7FpRCEQ7iMDjg8UmJnEmNdOyxyMoR8YbOrUBODe/Q5g7zCKYTrucfLr94C2uSrY2zpAIoRtYfpNMa7tFwj8IOPAcKHtyyYFlSKEOSmJsUVeEd7G5xMeG2zVmmsyxoCx6mo7ELuNb3VEhAT/usudE6O7PTFZhWTQi7zQ==</Encrypted>]]>&ProfileTab;<![CDATA[<Encrypted>&UjU/lspmwbFAWDk2U8G+7tPxzHwDo2yDvtN/1pEZ8jN8nA6liqjSGjV5XHSiW4esXDgWQYIsl5iCvTpwbp4eJZ/+Agxof+Pce4rLG3AJ4llmZyE2cMaoG07cb/WiDL6CgpzWVJjlhwl/eQxNZSvEvLC7RzwtZcTLjf+T9D7Dso+MHueEKGjZSZqKstUzLJt6ALJn2CVk/4KiB9JxnGDa2i5zRveWPPLwlKUq4L5JlZivgkHWnxTHdNiBSjIO2J4od/Fi0aHsMtrUFNGpSr7RbPYIDxvW14BA7XHxbyV98gtRA9JrfkfigHzsuo1b9yj9KCqJMrhIFgD617UXrU2cZBffJ/3ebpl4XOZ8KnMg2nQ/Eg5ilrqz3h2W0fx6VdPwOz4732sPYp12ay8Y/izOYv8N9etJGrdZbcG0KfIJSNZBu8xsL7v9zEr/b/oGlcYhas9Nxr5xpP7Q5IJrOvoMwcsMMPiGfD60j+d62VlF8i/hBS/RADUVkKJQT3m6g+orfSJDXQm8lf3nn/KilpYE2SAkMwbHiSC+ozy0tvvf3Ow7TDH5YmYm2l534n3b84IFQgQx4SDWc08EYp3U1xw5bdyweeYfMc/WkVbkEJ6b5/C0j/1jl8VQewvn5ta6Q4eAw4kCLkFYNXwZdQ7duNnT1Z+5yfoeQ65OJDsxt4Wghdf5UMsGJQM1oIV2PdbQOhM5y1Ky48VPfADaX0eL/Wkk/hTDwAj1PKpmGu4NX37dcDS7a/OCcorjNhsMihbWUH96UZQHtDpnj1gsaa6Md0Ks9T0ZJC9pzlNF6+uMCuApKANzdkA4Rj0P1dkNCJpvpQoWgsX/4las1F0e1lH+mYLRMCbPsHOIQscdhnO406UvdvGwAZ5IPI89uT8ihMA17klPFuRH6GT/Mj+ra/8FgubR1QOx7YxLVlAF1myGgv6bNqnarN+U5+C0DCdXHGopULeGgsEZz/4Zlj3cGsvUiBCy/Z5KEgSGo3IqzP4RqDIJ6oU/BRxBONyKw/ZzUq3tFJaWtGfkg+XS4wEkWlz6RYGRftTi08U1rS6ZmuWaReX7J2YyZxOVgPl4B85sAOg+dgVd5iP2B7n7Ka/OmKvv/qYpx5TCphPG8wJTPoA40YOvDGY9Bb/HkMglQHwEvpKgqn88Yv1jBaD5VUXQiDEgnlE7dQXp12+/CZFenCnkIvlY0KnK85UjYbIkSfhAPDABCU6C7+pDhh2JHksmv1GdmKiCY41FnUrUOimL7+lHAu0ZYoZUBJY9zcoR2vA4h2gaTaxxjxoOzJKOpMGSSvKchv1WrDk8KhYK+IEFAt6if/vrkG5Mdp6bNSlMeEItRm+vE3T9RounBXnfcxHPrn55wF+7za7M38tnoGkXiwn/7q+kSiIGyRI3bK/MMEFC8X6F+nnb4DUlQ7mWUL43gZc2Tit28mhHdqwa7hCgiKL5SQ8Y0bVQ7d2oKBps37LbtuN1Jntt4pyzy69WrR+jGlEiIaQEtJeIjap+7Rxs3Jd/AlcyFZfMg1OQDNQ/Meb8zViI7lgv+MfLR96Ug+/7H8mVITqsZXTMp0bgGKNaHqrH0utE2aYcVnkvx7VGYxQ8YCyLQriGUiu9jSswOMYLNnrxVp9btQq13e/cbNXXr84+P8soxFvL1eBkbbHP8HKgClbAE9yR0IPUCEU6QAOD2BYy8eSFkJ4tzzhjEpqpv30huzhz6qH/FqXla1gitnd0pqsKsnV2r2KLNEF26b5KjPlLMycr5Q==</Encrypted>]]>
      &ProfileScript;
      &OutlineEntry;
      &CheckValidEmailFunction;
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      &ProfileCss;
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFun8ELi2+Kh4l/pRgPM82JY1azoW1pKV55w2zdcHqKrROAESkGFRC1PdIl4enZMDHvoofF5H2qbhKJabyW2ooRIoNlNQpCIgq1Lgh3vQ0FPBbLuBfu0+K2wvtvNvbozFrI85nWD4g4H3lR2hFlLcxl9NbP2XxdRfOMV9yieOTHihxIw6T6ZxPSQKokvOQwd6sFbfLhBgdo8+BKzwva6gMVIQ==</Encrypted>]]>
    </text>
  </css>
</dir>