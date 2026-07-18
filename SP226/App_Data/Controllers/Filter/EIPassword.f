<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="tkhddt" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật mật khẩu sử dụng dịch vụ" e="Update Password"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="view_pass" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="view_pass2" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Nhắc lại mật khẩu" e="Retype Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1tsRx1/cjsycNYxfWXh6BH4kErpkNwFreg//uLxIy4SU1</encrypted>]]></clientScript>
    </field>
    <field name="pass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 200, 230, 0"/>
      <item value="11-1: [cpass].Label, [cpass], [chkpass]"/>
      <item value="11: [view_pass].Label, [view_pass]"/>
      <item value="11-1: [view_pass2].Label, [view_pass2], [pass]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7e6fRThx3BOGR746IzeVeSw3c7yK/cldoPtg6B8+RjCFlZ/S0Ki94LGSTgOeT/OcpFOpweXtJDdWhd9FB0JNfA=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7F9Hrm8bLDOs6RT/1ntdsew4neVfZfRCMHWq8AceXJVinNdx/bszVuwDJfZxxSCZPo</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RVmNi0O5lsMUjE49SF5coQ/AKBZ/KJR6pKeLnVMvA3Mri27Xm2W8TWYuyAnS10ShMuQyJD+YXeCrBSh8uELnD84HwgvmtDFwEslFD3MPPgxpgXQVnGtEad2RNmBziwQXwPCO/KkPoPn94YpvsuftgnhHIHjR9cauqUhn7/u3Xq6pK9/2KwP6WNNPcgYhOC2u+G1lXCYzykgLdXwEcV3Iy+bPVegl0cSJRE9ivEaX4a7DO4QMub718C0K5FHUaDTak5wEGQ16ME78TJf+cizDak=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LwH4U1s98MHeTjk8lppeM5Wnk9v/xkxXsQdXdIytDUL/l9RPCMVQvKZPNqa3d6Q/q4tcq645y5saskyeODJOBSPKRZ6UgQjmOWvLg5IJ11JKmOmcsS8HDFd3oIZBigJ4QDGf+usY7gSN80+y56L8GVMTPw31yMyGi6nFQbz7MwmNeZKqU2ht5T6t/As6mb8yZk2rtvUsrxI+9mgIRqQ6UMGfnewyxLXgIsswDjVObzxCk0MDBJu3xRT3r46gcq5lSVlBiB4gYoqp065KrVdDUUUcLBCeBk7NYxIXRwNQFT5hbHYppLHCXiboXoAAxvfsvrfoMtEa7g3lUH9dqc6120rDEU7lqnX5w+TU55hslam9A5djxUSxjmYhWBQe2U3TPOWMRGAysMZCGETXhKasDy/iPSh4MFkUfpr/zPtXBmO4m6OcEywIWU1mckbGIKg7cJoUkFWaYOPmJqjeDVZozDY/qEtSJuyglZ1LE4vMSsPV5yGGl09d9a1CqdaBfT4siPKMEmhvgZCuEPq/YN4hTZ3qRWqP/Cdf+EJbTseA5tRC2kKhIN/BiZLgj3Lru+vn0BtQayb8f2QVpY0bs0KdIh9SlOqJA0vmeZ9Yu3DKzangcckNx3rz2j3gV7o4cUviORkhc3idYPyM8to+ZtLsXfQK/jN3NRIhkwCDt0j/FY3uIuPLI96IDXmCXUpi8SIAPqlt8yWgcPY/a25hSDK8kAiZgPVI1kv0BCFHsyb6+Ob</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjmy5qh9o6yahgy9KNWbrdJTkD4bJG88YfHMdl/f9aLSkhkWB1Gm2YPkhMXE/dO8Wo1QsP4Kzcm7k5Azgkif01bc6mF5N/TQovAQDuCABmpMnT175QLkci5r5qliN80X403yZVQRdkZHekcX+IV/z878IqhFST8hKE2uqf0rhw45ZP3yfzpYkcaVl72iRUYQu/1f6HUKl/WPSjbmtgcIl0/QeKUA6bZ7idZg03yMbkUkE6w71qWAmUa3FyvXPUtd7GHOic4IxmqhA8xqOdOwl12D9fu1ShYXR1vWfWSWaaw4uEA5Af1C7b1Ff5EWTyk4ZD5qXe1bDo7ZZZAfG64fKyO6y8+38JCJaw5PBhbn7GAMGFpu7LkUZtNdyJKiSgxPnSdMwh/rY62V6Q+aXd1wHATPpbHR92RCmhXgZeRpEmynPUgfWa92/3+q3VzhZ5LyYtFz0QriHoAG3LQAm5NyOUDaE0XlLgJ7RYIQVKsSVNdoRRjQ0pyYjxZEU8HqBwnryaYe57j8JxE+cWyxE/o3bSOVigzb7MDvKAaUHNFQaJ3f+x714kC18VrR/XknTZQX9ZubeOb0O46pe8W+UBLkaQbinNTYnv4Yc3dZtCmdYsPVQl+LvHanFX7y8stbSis0NSzn9xeKGv/ZvgHTieHDHkKETgeeIxVFL062YLoDZC6m9RYxE/gv13TWID+4gfr9nZsh2LIHMk7tI9905WJGShKI82gqk239D0gNKOiGAVFN1QTUVVGfn8bmQnF8rdIM1QDAfvN278rO0Cx9Hcky/BjrdDl9QeLlbiL0t9jakLh3OXLkdx/7/7ngU7DE2n8Zjpu9ZmN1qLMt3pPfv0EuJKOdPWgDXIO4TjcK2uHmnnfS3WtsqDIeJBDUIeo6heP++C/D5JNyIFNQnLBNix4HYbX8bNQZPEaWDDV8kS4007lTD6U581Hs5muVGywh8mWQ3arF7dzK6exqclpuZmNI3z6IZl/u/faJHRC91aU+9a9zv31N+J+2ElCA+pS0Cpl6UzeMbhCoS7LSyLCaIFNELPi+k4i0bzvmYXSjbgd88vn3+GWjbhwy0lI3W9f8v27cR/14KWzSEnbtXEyprEFdJaKuVuiSuhx2K+U2xVTaOsVFSCIQPhFFekWKhP+lMdtwE4ta+US1xDicRpX1qJcVgzt35/DAgvyZ43NP+203zhSXSb6cSfWlyqWvNrv0JqF0dXAJjAuD4l9naCKv84y4RFwomCZzu2veVCt/+1RNixRinksylJdAW3XavOxVHh3E/G2DO9MGKPBpMRCPrEGlmNItydGXsQaGvXwLg1RsNM2pJoFFL1VbPb56gVzbhpMdRQxZM/vk9Fp2BaY8jnKDyXx5I2HWVXwWhc02jUio0+cKECNPutAJTi+Kyv2GjzpPc++HWxukG500OE8deruIFpX8b4vde5qDeyRPlrG84NFiUWcBH3wO1F4RLynO7PN8U8m1YqdjxETcamfYXXwCOImwZhuFjHbrILxfo4io8+ls6Q==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5cBdf+Y6fnghL241kyDz6YVX/jV68KjRqPZfYObLs198eJ7N163RjkeuXcCXYvGag==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>